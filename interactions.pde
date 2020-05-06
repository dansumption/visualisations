
void keyPressed() {
  switch(key) {
    case '\n':
      sample.cue(0);
      sample.play();
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
    case 'e':
      spikeMultiplier = 5;
      println("Spikes", spikeMultiplier);
      break;
    case 'r':
      spikeMultiplier = 75;
      println("Spikes", spikeMultiplier);
      break;
    case 't':
      spikeMultiplier = 150;
      println("Spikes", spikeMultiplier);
      break;

      case 'd':
        alphaMultiplier = 15;
        println("alphaMultiplier", alphaMultiplier);
        break;
      case 'f':
        alphaMultiplier = 45;
        println("alphaMultiplier", alphaMultiplier);
        break;
      case 'g':
        alphaMultiplier = 250;
        println("alphaMultiplier", alphaMultiplier);
        break;
        
      case 'u':
        spikeRadius = 3;
        println("spikeRadius", spikeRadius);
        break;
      case 'i':
        spikeRadius = 23;
        println("spikeRadius", spikeRadius);
        break;
      case 'o':
        spikeRadius = 99;
        println("spikeRadius", spikeRadius);
        break;

      case 'j':
        bodyRadius = 1;
        println("bodyRadius", bodyRadius);
        break;
      case 'k':
        bodyRadius = 5;
        println("bodyRadius", bodyRadius);
        break;
      case 'l':
        bodyRadius = 15;
        println("bodyRadius", bodyRadius);
        break;

      case 'v':
        defaultVelocity = 0.5;
        println("defaultVelocity", defaultVelocity);
        break;
      case 'b':
        defaultVelocity = 5;
        println("defaultVelocity", defaultVelocity);
        break;
      case 'n':
        defaultVelocity = 15;
        println("defaultVelocity", defaultVelocity);
        break;

      case 'z':
        smoothFactor = 0.999;
        break;
      case 'x':
        smoothFactor = 0.95;
        break;
      case 'c':
        smoothFactor = 0.5;

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
        break;
      case ']':
        spiky = true;
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
  setVectors(new PVector(mouseX, mouseY));
}
