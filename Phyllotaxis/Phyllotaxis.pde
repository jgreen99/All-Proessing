//declared the float options. Remember:
//I converted JavaScript to Java in Processing.
float n = 0;
float c = 4;

//Made my setup void here. This will
//work with the draw void.
//I declared my background and screen
//size. I also made them colorful.
void setup() {
  size(400, 400);
  colorMode(HSB);
  background(0);
  
}

//Made my other void draw. This code will
//set up the background, declares the
//floats, stroke, fill and ellipse functions.
void draw() {
  float a = n * 137.5;
  float r = c * sqrt(n);
  float x = r * cos(radians(a)) + width / 2;
  float y = r * sin(radians(a)) + height / 2;
  fill(a % 256, 255, 255);
  stroke(255);
  ellipse(x, y, 4, 4); 
  n++;
}