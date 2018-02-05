float angle = 0;
//r(beta) = 0.8 + 1.6 * sin(6 * beta)
//theta(beta) = 2 * beta
//phi(beta) = 0.6 * pi * sin(12 * beta)

//x = r * cos(phi) * cos(theta)
//y = r * cos(phi) * sin(theta)
//z = r * sin(phi)

void setup() {
  size(600, 400, P3D);
}

void draw() {
  background(0);
  translate(width/2, height/2);
  rotateY(angle);
  angle += 0.03;

  float beta = 0;
  
  noFill();
  stroke(255);
  strokeWeight(8);
  beginShape();
  while (beta < PI) {
    float r = 100*(0.8 + 1.6 * sin(6 * beta));
    float theta = 2 * beta;
    float phi= 0.6 * PI * sin(12 * beta);
    float x = r * cos(phi) * cos(theta);
    float y = r * cos(phi) * sin(theta);
    float z = r * sin(phi);
    stroke(255, r, 255);
    
    beta += 0.01;
    vertex(x, y, z);
  }
  endShape();
}