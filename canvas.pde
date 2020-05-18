class  Canvas {
  int numParticles;
  color bg = color(0);
  boolean wipeClean = false;
  Particle[] particles; 

  Canvas(int numParticles) {
    this.numParticles = numParticles;
    background(bg);
    particles = new Particle[numParticles];
    // for (int i=0; i<numParticles; i++) {
    //   PVector position = randomPoint();
    //   PVector vector = randomVector();
    //   particles[i] = new Particle(i, position, vector);
    // }
  }

  void draw(float[] levels) {
    if (wipeClean) {
      background(bg);
    }
    for (int i=0; i<numParticles; i++) {
      particles[i].draw(levels[i]);
    }
  }
}