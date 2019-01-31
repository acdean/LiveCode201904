// LiveCode201904 2019-01-25 21:16:55

import peasy.*;

boolean video = false;
PeasyCam cam;
int W;
Ribbon ribbon1, ribbon2, ribbon3;

void setup() {
  size(1280, 720, P3D);
  cam = new PeasyCam(this, width * 1.5);
  //rrandomSeed(15); // 4, 13
  W = width / 2;
  ribbon1 = new Ribbon();
  ribbon2 = new Ribbon();
  ribbon3 = new Ribbon();
}

void draw() {

  background(0);
  fill(255, 255, 0);
  noStroke();

  ribbon1.draw();
  ribbon2.draw();
  ribbon3.draw();

  // video stuff
  if (video) {
    saveFrame("frame#####.png");
    if (frameCount > 500) {
      exit();
    }
  }
}

class Ribbon {
  float z = 0;
  color c;
  float period;
  float phase;
  float delta;

  Ribbon() {
    init();
  }

  void init() {
    z = random(1000);
    c = color((int)random(0, 256), (int)random(0, 256), (int)random(0, 256));
    period = random(-.02, .02);
    phase = random(TWO_PI);
    delta = random(-.02, .02);
  }

  void draw() {
    for (int x = -W; x < W; x += 2) {
      pushMatrix();
      fill(c);
      rotateX(phase + (x * period));
      translate(x * 5, 0, z);
      box(5, 1500, 5);
      popMatrix();
    }
    phase += delta;
  }
}

// save a snapshot on keypress
void keyPressed() {
  if (key == ' ') {
    ribbon1.init();
    ribbon2.init();
    ribbon3.init();
  } else {
    saveFrame("snap####.png");
  }
}