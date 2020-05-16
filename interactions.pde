
void keyPressed() {
  switch(key) {
    case '\n':
      sample.cue(0);
      sample.play();
      break;
    case ' ':
      sample.pause();
      break;
    case '\b':
      background(bg);
      break;
    case '.':
      sample.jump(sample.position() + 60);
      break;
    case ',':
      sample.jump(sample.position() - 60);
      break;

    case 'q':
      spikeMultiplier *= 0.8;
      println("Spikes", spikeMultiplier);
      break;
    case 'w':
      spikeMultiplier = initialSpikeMultiplier;
      println("Spikes", spikeMultiplier);
      break;
    case 'e':
      spikeMultiplier *= 1.2;
      println("Spikes", spikeMultiplier);
      break;

      case 'a':
        alphaMultiplier *= 0.8;
        println("alphaMultiplier", alphaMultiplier);
        break;
      case 's':
        alphaMultiplier = initialAlphaMultiplier;
        println("alphaMultiplier", alphaMultiplier);
        break;
      case 'd':
        alphaMultiplier *= 1.2;
        println("alphaMultiplier", alphaMultiplier);
        break;
        
      case 'u':
        spikeRadius *= 0.8;
        println("spikeRadius", spikeRadius);
        break;
      case 'i':
        spikeRadius = initialSpikeRadius;
        println("spikeRadius", spikeRadius);
        break;
      case 'o':
        spikeRadius *= 1.2;
        println("spikeRadius", spikeRadius);
        break;

      case 'j':
        bodyRadius *= 0.8;
        println("bodyRadius", bodyRadius);
        break;
      case 'k':
        bodyRadius = initialBodyRadius;
        println("bodyRadius", bodyRadius);
        break;
      case 'l':
        bodyRadius *= 1.2;
        println("bodyRadius", bodyRadius);
        break;

      case 'v':
        defaultVelocity *= 0.8;
        println("defaultVelocity", defaultVelocity);
        break;
      case 'b':
        defaultVelocity = initialDefaultVelocity;
        println("defaultVelocity", defaultVelocity);
        break;
      case 'n':
        defaultVelocity *= 1.2;
        println("defaultVelocity", defaultVelocity);
        break;

      case 'z':
        smoothFactor *= 0.8;
        println("smoothFactor", smoothFactor);
        break;
      case 'x':
        smoothFactor = initialSmoothFactor;
        println("smoothFactor", smoothFactor);
        break;
      case 'c':
        smoothFactor *= 1.2;
        println("smoothFactor", smoothFactor);
        break;

      case 'f':
        beatMultiplier *= 0.8;
        println("beatMultiplier", beatMultiplier);
        break;
      case 'g':
        beatMultiplier = initialBeatMultiplier;
        println("beatMultiplier", beatMultiplier);
        break;
      case 'h':
        beatMultiplier *= 1.2;
        println("beatMultiplier", beatMultiplier);
        break;

      case '\'':
        fillIn = false;
        println("fillIn", fillIn);
        break;
      case '#':
        fillIn = true;
        println("fillIn", fillIn);
        break;
      
      case '[':
        spiky = false;
        println("bubbly");
        break;
      case ']':
        spiky = true;
        println("spiky");
        break;      

      case '0':
      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
        String keyValue = str(key);
        int value = Integer.valueOf(keyValue);
        setBandColours(value);
        break;
  }
}

void mousePressed() {
  // setVectors(new PVector(mouseX, mouseY));
}
