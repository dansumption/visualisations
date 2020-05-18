// class Flower {
//   float size;
//   int centreSize;
//   int outerSize;
//   PVector position;
//   int petals;
//   color centreColor;
//   color petalColor;

//   Flower() {
//     size = 1;
//     centreSize = int(random(1, 80));
//     outerSize = int(centreSize + random(10, 80));
//     position = new PVector(int(random(0, width)), int(random(height)));
//     petals = int(random(4, 9));
//     if (petals == 3) { outerSize *= 1.5; }
//     centreColor = color(int(random(0, 255)), int(random(0, 255)), int(random(0, 255)), 7);
//     petalColor = color(int(random(0, 255)), int(random(0, 255)), int(random(0, 255)), 15);
//   }

//   boolean draw(float level) {
//     noStroke();
//     pushMatrix();
//     translate(position.x, position.y);

//     if (size <= centreSize) {
//       fill(centreColor);
//       circle(0, 0, size);
//     }
//     else if (size <= outerSize) {
//       fill(petalColor);
//       float increment = TWO_PI/float(petals);
//       for (float angle=0;angle<TWO_PI;angle += increment) {
//         bezier(
//           centreSize/2*cos(angle), centreSize/2*sin(angle), 
//           size*cos(angle), size*sin(angle), 
//           size*cos(angle + increment), size*sin(angle + increment), 
//           centreSize/2*cos(angle+increment), centreSize/2*sin(angle+increment) 
//         );
//       }
//       fill(centreColor);
//       circle(0, 0, centreSize);
//     }
//     popMatrix();
//     size+= level;
//     return (size > outerSize ? true : false);
//   }
// }