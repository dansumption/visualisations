
void draw() {
  if (sample.isPlaying()) {
    fft.analyze();
    for (int i = 0; i < numBands; i++) {
      eqbands[i].update(fft.spectrum[i]);
      eqbands[i].draw();
    }
  }
}