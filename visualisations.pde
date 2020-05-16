
void draw() {
  if (sample.isPlaying()) {
    fft.analyze();

    float level = (float) Math.pow(fft.spectrum[0], 1) * 3;
    for (int i = 0; i < numFlowers; i++) {
      if (flowers[i].draw(level)) {
        flowers[i] = new Flower();
        // started = false;
      }
    }

    // for (int i = 0; i < numBands; i++) {
    //   eqbands[i].update(fft.spectrum[i]);
    //   eqbands[i].draw();
    // }
  }
}