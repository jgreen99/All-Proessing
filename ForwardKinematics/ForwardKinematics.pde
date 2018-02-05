Segment tentacle;
//Segment seg2;
void setup() {
  size(800, 600);
  float t = 0.1;
  float len = 50;
  tentacle = new Segment(width/2, height, 10, 0, t);

  Segment current = tentacle;
  for (int i = 0; i < 20; i++) {
    Segment next = new Segment(current, len, 0, t);
    len = len*0.75;
    current.child = next;
    current = next;
  }
}

void draw() {
  background(51);
  Segment next = tentacle;
  while (next != null) {
    next.wiggle();
    next.update();
    next.show();
    next = next.child;
  }
}