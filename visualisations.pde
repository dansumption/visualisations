
void draw() {
  strokeWeight(1);
  noFill();

  fft.analyze();
  for (int i = 0; i < numBands; i++) {
    eqbands[i].update(fft.spectrum[i]);
    eqbands[i].draw();
  }
}