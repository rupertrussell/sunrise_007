// Author rupert russell
// 7 August 2020
// Sunrise_007
// artwork on redbubble at: https://www.redbubble.com/people/rupertrussell/works/54400153-sunrise-v001?asc=u
// code on github at:

// int scale = 7500; // for redbubble
int scale = 750;

// int sW = 25; // for redbubble
int sW = 2;

int count = 0;

float step = 2 * PI / 360;
float h = 0;
float k = 0;
float r = scale / 2;

float[] degreesXpos = new float[361 * 2];
float[] degreesYpos = new float[361 * 2];

void setup() {
  // size(9144, 9144); // for redbubble
  size(914, 914);
  strokeWeight(sW);
}

void draw() {
  noLoop();
  background(100);
  translate(width / 2, height / 2); // center coordinates

  // top white semicircle
  fill(255);
  arc(0, 0, scale, scale, radians(180), radians(360));

  // bottom black semicircle
  fill(0);
  arc(0, 0, scale, scale, radians(0), radians(180));

  // calculate 360 points on the circle
  for (float theta = 0; theta < 2 * PI; theta = theta + step) {

    float x = h + r * cos(theta);
    float y = k - r * sin(theta);

    // save the position of each point on the circumfrence
    degreesXpos[count] = x;
    degreesYpos[count] = y;


    // draw red points around the circumfrence
    // fill(255, 0, 0);
    // ellipse(x, y, 3, 3);

    count ++;
  }
  count = 0;

  // draw upper half black lines 
  stroke(0);
  for (int n = 3; n < 180; n = n + 3) {
    line(degreesXpos[n], degreesYpos[n], degreesXpos[180 -n], degreesYpos[180 -n]);
  }

  // draw lower half white lines 
  stroke(255);
  for (int n = 0; n < 180; n = n + 3) {
    line(degreesXpos[n], - degreesYpos[n], degreesXpos[180 - n ], - degreesYpos[180 -n]);
  }

  // tidy up top arc
  stroke(0);
  noFill();
  arc(0, 0, scale, scale, radians(180), radians(360));

  // tidy up lower arc
  stroke(255);
  noFill();
  arc(0, 0, scale, scale, radians(0), radians(180));


  save("SunRise_007.png");
  // exit();
}
