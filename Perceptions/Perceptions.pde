//Today I'm doing perceptrons.
//A perceptron is an algorithm
//for binary classifiers.

Perceptron p;

Point[] points = new Point[100];

void setup() {
  size(600, 600);
  p = new Perceptron();
  
  for (int i = 0; i < points.length; i++) {
    
  }
  
  float[] inputs = {-1, 0.5};
  int guess = p.guess(inputs);
  println(guess);
}

void draw() {
  background(255);
  line(0, 0, width, height);
  for (Point p : points) {
    p.show();
  }
}