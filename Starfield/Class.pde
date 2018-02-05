class Star {
  float x;
  float y;
  float z;

  float sx;

  float pz;

  Star() {
    x = random(-width, width);
    y = random(-height, height);
    z = random(width);
    pz = z;
  }
  float speed; 
  void update() {
    speed = map(mouseX, 0, width, 0, 20);
    z = z - speed;
    if (z < 1) {
      z = width;
      x = random(-width, width);
      y = random(-height, height);
    }
  }

  void show () {
    fill(255);
    noStroke();

    float sx = map(x / z, 0, 1, 0, width);
    float sy = map(y / z, 0, 1, 0, height);

    float r = map(z, 0, width, 16, 0);
    ellipse(sx, sy, 0, r);

    float px = map(x / pz, 0, 1, 0, width);
    float py = map(y / pz, 0, 1, 0, height);

    pz = z;

    stroke(255);
    line(px, py, sx, sy);
  }
}