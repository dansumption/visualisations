import processing.sound.*;

String path = "./audio/";
String file = path + "Æthereal Arthropod - TORAX.wav";
//"11 Blood Duster.mp3";
//"Hey Sholay - The Bears the Clocks the Bees.mp3";
//"majick_klown.mp3";
//"15 Ujaku.mp3";

float smooth_factor = 0.9;
float spikeMultiplier = 100;
float alphaMultiplier = 128;
float largeOuterRadius = 50;
float smallOuterRadius = 50;
float innerRadiusMultiplier = 20;
float smallVelocity = 30;
float largeVelocity = 10;
float blastRatio = 1.4;

color bg = color(0);
int numBands = 128;
EQBand[] eqbands = new EQBand[numBands];
SoundFile sample;
FFT fft;
Sound device;

public void settings() {
  size(1280, 720);
}

void setup() {
  background(bg);

  for (int i = 0; i < numBands; i++) {
    eqbands[i] = new EQBand(i);
  }

  device = new Sound(this);
  sample = new SoundFile(this, file);
  fft = new FFT(this, numBands);
  fft.input(sample);
}
