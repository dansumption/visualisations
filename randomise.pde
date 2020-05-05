
PVector randomPoint () {
  int x = round(random(0, width));
  int y = round(random(0, height));
  return new PVector(x, y);
}

PVector randomVector () {
  float x = random(0, 1) - 0.5;
  float y = random(0, 1) - 0.5;
  return new PVector(x, y);
}
