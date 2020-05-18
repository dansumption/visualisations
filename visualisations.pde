int numBands = 64;
Canvas canvas;

public void settings() {
  size(1280, 720);
}

void setup() {
  frameRate(60);
  device = new Sound(this);
  sample = new SoundFile(this, file);
  fft = new FFT(this, numBands);
  fft.input(sample);
  canvas = new Canvas(numBands);
}

void draw() {
  if (sample.isPlaying()) {
    fft.analyze();
    canvas.draw(fft.spectrum);
  }
}