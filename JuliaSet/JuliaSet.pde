// Daniel Shiffman
// http://codingtra.in
// http://patreon.com/codingtrain
// Code for: https://youtu.be/6z7GQewK-Ks

float angle = 0;

void setup() {
  size(640, 480);
  colorMode(HSB, 1);
}
void draw() {
  
  //float ca = map(mouseX, 0, width, -1, 1);//-0.7;
  //float cb = map(mouseY, 0, height, -1, 1);//-0.3;
  float ca = cos(angle*3.213);//*sin(angle);
  float cb = sin(angle);
  
  angle +=0.02;
  
  background(255);

  // Establish a range of values on the complex plane
  // A different range will allow us to "zoom" in or out on the fractal

  // It all starts with the width, try higher or lower values
  float w = 3;
  float h = (w * height) / width; //

  // Start at negative half the width and height
  float xmin = -w/2; //xmin will equal -2.5
  float ymin = -h/2; //ymin will equal -3.3

  // Make sure we can write to the pixels[] array.
  // Only need to do this once since we don't do any other drawing.
  loadPixels();

  // Maximum number of iterations for each point on the complex plane
  int maxiterations = 100;

  // x goes from xmin to xmax
  float xmax = xmin + w; // xmax will equal 2.5
  // y goes from ymin to ymax
  float ymax = ymin + h; //ymax will equal 2.3

  // Calculate amount we increment x,y for each pixel
  float dx = (xmax - xmin) / (width); //dx will equal 0
  float dy = (ymax - ymin) / (height); // dy will equal -1

  // Start y
  float y = ymin; //ymin is -3.3
  for (int j = 0; j < height; j++) {
    // Start x
    float x = xmin; //xmin is -2.3
    for (int i = 0; i < width; i++) {

      // Now we test, as we iterate z = z^2 + cm does z tend towards infinity?
      float a = x; //-2.3
      float b = y;
      int n = 0;
      while (n < maxiterations) {
        float aa = a * a;
        float bb = b * b;
        // Infinty in our finite world is simple, let's just consider it 16
        if (a*a + b*b > 16.0) {
          break;  // Bail
        }
        n++;
        float twoab = 2.0 * a * b;
        a = aa - bb + ca;
        b = twoab + cb;
      }

      // We color each pixel based on how long it takes to get to infinity
      // If we never got there, let's pick the color black
      if (n == maxiterations) {
        pixels[i+j*width] = color(0);
      } else {
        // Gosh, we could make fancy colors here if we wanted
        float h2 = sqrt(float(n) / maxiterations);
        pixels[i+j*width] = color(h2, 255, 255);
      }
      x += dx;
    }
    y += dy;
  }
  updatePixels();
  println(frameRate);
}