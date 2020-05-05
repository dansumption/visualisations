
void keyPressed() {
  switch(key) {
    case 'q':
      exit();
    case 's':
      sample.cue(0);
      sample.play();
      break;  
    case 'c':
      background(bg);
      break;
    case '.':
      sample.jump(sample.position() + 60);
      break;
    case ',':
      sample.jump(sample.position() - 60);
      break;
    case 'e':
      spikeMultiplier++;
      println("Spikes", spikeMultiplier);
      break;
    case 'd':
      if (spikeMultiplier > 1) {
        spikeMultiplier--;
      }
      println("Spikes", spikeMultiplier);
      break;

      case 'r':
        alphaMultiplier *= 1.1;
        println("alphaMultiplier", alphaMultiplier);
        break;
      case 'f':
        alphaMultiplier *= 0.9;
        println("alphaMultiplier", alphaMultiplier);
        break;
      case 't':
        largeOuterRadius *= 1.1;
        println("largeOuterRadius", largeOuterRadius);
        break;
      case 'g':
        largeOuterRadius *= 0.9;
        println("largeOuterRadius", largeOuterRadius);
        break;
      case 'y':
        smallOuterRadius *= 1.1;
        println("smallOuterRadius", smallOuterRadius);
        break;
      case 'h':
        smallOuterRadius *= 0.9;
        println("smallOuterRadius", smallOuterRadius);
        break;
      case 'u':
        innerRadiusMultiplier *= 1.1;
        println("innerRadiusMultiplier", innerRadiusMultiplier);
        break;
      case 'j':
        innerRadiusMultiplier *= 0.9;
        println("innerRadiusMultiplier", innerRadiusMultiplier);
        break;
      case 'i':
        smallVelocity *= 1.1;
        println("smallVelocity", smallVelocity);
        break;
      case 'k':
        smallVelocity *= 0.9;
        println("smallVelocity", smallVelocity);
        break;
      case 'o':
        largeVelocity *= 1.1;
        println("largeVelocity", largeVelocity);
        break;
      case 'l':
        largeVelocity *= 0.9;
        println("largeVelocity", largeVelocity);
        break;
      case 'p':
        blastRatio *= 1.05;
        println("blastRatio", blastRatio);
        break;
      case ';':
        blastRatio *= 0.95;
        println("blastRatio", blastRatio);
        break;
      case '#':
        PVector newVector = new PVector(0, -10, 0);
        for (int i = 0; i < numBands; i++) {
          eqbands[i].vector.add(newVector);
        }
        break;
      case '\'':
        for (int i = 0; i < numBands; i++) {
          eqbands[i].setVector(randomVector());
        }
        break;

  }
}
