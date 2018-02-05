ArrayList<Firework> fireworks; //This array list is used to make the fireworks.

PVector gravity = new PVector(0, 0.2); //gravity puts up the fireworks

void setup() {
  size(640, 360, P2D); //The size of the sketch
  fireworks = new ArrayList<Firework>(); //redeclared the array list briefly mentioned in line 1.
  colorMode(HSB); //Makes the fireworks colorful.
  background(51); //sets up the background of the skecth.
}

void draw() {
  if (random(1) < 0.08) {
   fireworks.add(new Firework()); //if the random value from 1 is less than 0.08 then add more fireworks.
  }
  fill(51, 50); //fills in the fireworks.
  noStroke(); //skips over stroke when running this command.
  rect(0,0,width,height); //the fireworks.
  
  for (int i = fireworks.size()-1; i >=0; i--) {
    Firework f = fireworks.get(i); //made a new firework and referenced it to line 1
    f.run(); //runs the fireworks.
    if (f.done()) {
      fireworks.remove(i); //removes the fireworks
    }
  }
}