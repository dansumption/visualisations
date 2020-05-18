
class Particle {
  PVector position;
  PVector vector;
  int index;
  float intensity = 0;
  float[] previousLevels = new float[50];
  boolean beat = false;
  EQBand eqBand;

  Particle(int i, PVector position, PVector vector) {
    this.index = i;
    // this.eqBand = new EQBand(i);
    this.position = position;
    this.vector = vector;
  }

  void draw(float level){
    float averageLevel = updateLevels(level);
    beat = (averageLevel > level*beatMultiplier);
    intensity = level + (intensity - level) * smoothFactor;
    // eqBand.update(intensity);
    // eqBand.draw();
  }
  
  void updatePosition(float intensity) {
    if (this.x() < 0 || this.x() > width) {
      this.position.x -= vector.x;
      this.vector.x *= -0.7;
      this.vector.y *= random(0, 0.2) - 0.1;
    }
    
    if (this.y() < 0 || this.y() > height) {
      this.position.y -= vector.y;
      this.vector.y *= -0.7;
      this.vector.x *= random(0, 1) - 0.5;
    }
  }

  void setVector (PVector newVector) {
    this.vector = newVector;
  }

  
  float updateLevels(float newValue) {
    float sum = 0;
    for (int i = 0; i < previousLevels.length; i++) {
      sum += previousLevels[i];
      if (i < previousLevels.length - 1) {
        previousLevels[i] = previousLevels[i+1];
      }
    }
    float average = sum/previousLevels.length;
    previousLevels[previousLevels.length - 1] = newValue;
    return average;
  }

  
  float x() {
    return this.position.x;
  }
  
  float y() {
    return this.position.y;
  }
}