color bg = color(0);

public void settings() {
  size(1280, 720);
}

void setup() {
  background(bg);
  frameRate(120);

  for (int i = 0; i < numBands; i++) {
    eqbands[i] = new EQBand(i);
  }

  device = new Sound(this);
  sample = new SoundFile(this, file);
  fft = new FFT(this, numBands);
  fft.input(sample);
}
