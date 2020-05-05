
class EQBand {
  int radius;
  PVector position;
  PVector vector;
  float intensity;
  int index;
  boolean surging = false;
  
  EQBand(int i) {
    this.index = i;
    this.radius = 0;
    this.position = randomPoint();
    this.vector = randomVector();
  }

  
  void update(float level){
    this.surging = (level > this.intensity * blastRatio);
    this.intensity = level + (this.intensity - level) * smooth_factor;
    if (random(0, 1) > 0.9) {
      this.vector.add(randomVector()).normalize();
    }
    
    PVector effectiveVector = this.vector.copy().mult(this.intensity * (surging ? smallVelocity : largeVelocity));
   
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
    color blobColour = color(this.index % 2 == 0 ? 255 : 0, intensity * alphaMultiplier);
    strokeWeight(1);
    stroke(blobColour);
    if (surging) {
      fill(blobColour);
    }
    else {
      noFill();
    }

    int spikeCount = round(this.intensity * spikeMultiplier + 3);
    float innerRadius = this.intensity * innerRadiusMultiplier;
    float outerRadius = innerRadius * (1 + this.intensity * (surging ? largeOuterRadius : smallOuterRadius));
    
    pushMatrix();
    translate(round(this.position.x), round(this.position.y));
    float increment = TWO_PI/float(spikeCount);
    for (float angle=0;angle<TWO_PI;angle += increment)
      triangle(
        innerRadius*cos(angle), innerRadius*sin(angle), 
        outerRadius*cos(angle+float(spikeCount)/2), outerRadius*sin(angle+float(spikeCount)/2), 
        innerRadius*cos(angle+float(spikeCount)), innerRadius*sin(angle+float(spikeCount)) 
      );
    popMatrix();
  }
  
  float x() {
    return this.position.x;
  }
  
  float y() {
    return this.position.y;
  }
}
