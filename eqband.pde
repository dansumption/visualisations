float smooth_factor = 0.9;
float spikeMultiplier = 70;
float alphaMultiplier = 47;
float spikeRadius = 23;
float bodyRadius = 10;
float defaultVelocity = 10;
boolean fillIn = true;
boolean spiky = false;

color[][] palettes = {
  {#461220, #590B3A, #B87333, #05083D, #122406},
  {#247ba0, #70c1b3, #b2dbbf, #f3ffbd, #ff1654},
  {#e89005, #ec7505, #d84a05, #f42b03, #000000},
  {#2d00f7, #6a00f4, #8900f2, #a100f2, #b100e8, #bc00dd, #d100d1, #db00b6, #e500a4, #f20089},
  {#09f04a, #12ffd1, #0cbcff, #540fff, #cb0eff, #ff0ebc, #ff510b, #ffca09},
  {#1e150a, #734729, #4f130d, #4f130d, #281009, #412410, #1e150a, #4f130d, #734729},
  {#ffffff, #000000, #0000ff}
};

int numBands = 128;
EQBand[] eqbands = new EQBand[numBands];

class EQBand {
  int radius;
  PVector position;
  PVector vector;
  float intensity;
  int index;
  float spike;
  color colour;

  EQBand(int i) {
    this.index = i;
    this.radius = 0;
    this.position = randomPoint();
    this.vector = randomVector();
    setColour(0);
  }

  void setColour(int set) {
    println("Set colour", set);
    if (set == 0 || palettes.length < set) {

        this.colour = color(this.index % 2 == 0 ? 0 : 255);
    }
    else {
        set--;
        this.colour = palettes[set][int(random(0, palettes[set].length))];
    }
  }

  
  void update(float level){
    this.spike = 1; //(float)Math.pow((level - this.intensity), 2);
    this.intensity = level + (this.intensity - level) * smooth_factor;
    if (random(0, 1) > 0.9) {
      this.vector.add(randomVector()).normalize();
    }
    
    PVector effectiveVector = this.vector.copy().mult(this.intensity * defaultVelocity);
   
    this.position.add(effectiveVector);
    
    if (this.x() < 0 || this.x() > width) {
      this.position.x -= effectiveVector.x;
      this.vector.x *= -1;
      this.vector.y *= random(0, 0.2) - 0.1;
    }
    
    if (this.y() < 0 || this.y() > height) {
      this.position.y -= effectiveVector.y;
      this.vector.y *= -1;
      this.vector.x *= random(0, 0.2) - 0.1;
    }
  }
  
  void setVector (PVector newVector) {
    this.vector = newVector;
  }

  
  void draw() {
    color blobColour = color(red(colour), green(colour), blue(colour), int(intensity * alphaMultiplier) + 1);
    if (fillIn) {
      noStroke();
      fill(blobColour);
    } else {
    strokeWeight(1);
    stroke(blobColour);
    noFill();
    }

    int spikeCount = round(this.intensity * spikeMultiplier + 3);
    float innerRadius = this.intensity * bodyRadius;
    float outerRadius = innerRadius * (1 + this.intensity * spike * spikeRadius);
    
    pushMatrix();
    translate(round(this.position.x), round(this.position.y));
    drawBubbly(spikeCount, innerRadius, outerRadius);
    popMatrix();
  }

  void drawSpiky(int spikeCount, float innerRadius, float outerRadius) {
    float increment = TWO_PI/float(spikeCount);
    for (float angle=0;angle<TWO_PI;angle += increment)
      triangle(
        innerRadius*cos(angle), innerRadius*sin(angle), 
        outerRadius*cos(angle+float(spikeCount)/2), outerRadius*sin(angle+float(spikeCount)/2), 
        innerRadius*cos(angle+float(spikeCount)), innerRadius*sin(angle+float(spikeCount)) 
      );
  }

  void drawBubbly(int spikeCount, float innerRadius, float outerRadius) {
    float increment = TWO_PI/float(spikeCount);
    for (float angle=0;angle<TWO_PI;angle += increment)
      bezier(
        innerRadius*cos(angle), innerRadius*sin(angle), 
        outerRadius*cos(angle - increment +float(spikeCount)/2), outerRadius*sin(angle - increment+float(spikeCount)/2), 
        outerRadius*cos(angle + increment +float(spikeCount)/2), outerRadius*sin(angle + increment+float(spikeCount)/2), 
        innerRadius*cos(angle+float(spikeCount)), innerRadius*sin(angle+float(spikeCount)) 
      );

  }
  
  float x() {
    return this.position.x;
  }
  
  float y() {
    return this.position.y;
  }
}

void setBandColours(int value) {
  for (int i = 0; i < numBands; i++) {
    eqbands[i].setColour(value);
  }
}

void setVectors(PVector point) {
  for (int i = 0; i < numBands; i++) {
    PVector newVector = point.copy().sub(eqbands[i].position).normalize();
    eqbands[i].setVector(newVector);
  }
}