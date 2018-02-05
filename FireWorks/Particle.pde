//This class is used to show the particles from when the fireworks explode.
class Particle {
  PVector location; //the location of the firework.
  PVector velocity; //how high the firework is going
  PVector acceleration; //how fast the firework is going.
  float lifespan; //how long the firework lasts.
  
  boolean seed = false; //when boolean seed = false, it is not true.
  
  float hu; //color variable.
  
  Particle(float x, float y, float h) { //particle references the class Particle on line 2.
    hu = h; //h will equal u.
    
    acceleration = new PVector(0, 0); //acceleration os a new PVector.
    velocity = new PVector(0, random(-12, -5)); //velocity is a new PVector.
    location = new PVector(x, y); //location becomes a new PVector.
    seed = true; //seed will become true.
    lifespan = 255.0; //lifespan is given the number 255.0.
  }
  
  Particle(PVector l, float h) {
    hu = h; //same thing happens in the first Particle.
    acceleration = new PVector(0, 0);
    velocity = PVector.random2D();
    velocity.mult(random(4, 8));
    location = l.copy();
    lifespan = 255.0;
  }
  
  void applyForce(PVector force) {
   acceleration.add(force);
  }
  
  void run() {
    update();
    display();
  }
  
  boolean explode() {
    if (seed && velocity.y > 0) {
     lifespan = 0;
     return true;
    }
    return false;
  }
  
  void update() {
    
    velocity.add(acceleration);
    location.add(velocity);
    if(!seed) {
      lifespan -=5.0;
      velocity.mult(0.95);
    }
    acceleration.mult(0);
  }
  
  void display() {
    stroke(hu, 255, 255, lifespan);
    if (seed) {
     strokeWeight(4); 
    }else {
     strokeWeight(2); 
    }
    point(location.x, location.y);
  }
  
  boolean isDead() {
    if(lifespan < 0.0) {
     return true; 
    }else {
     return false; 
    }
  }
}