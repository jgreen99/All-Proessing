import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;

//began by declaring my planet named the sun.
Planet sun;

PeasyCam cam;

PImage sunTexture;
PImage[] textures = new PImage[2];

//made a function named setup, setup declares my size, updates sun and spawns moons.
void setup() {
  size(600, 600, P3D);
  sunTexture = loadImage("sun.jpg");
  textures[0] = loadImage("mars.jpg");
  textures[1] = loadImage("earth.jpg");
  cam = new PeasyCam(this, 500);
  sun = new Planet(50, 0, 0, sunTexture);
  sun.spawnMoons(4, 1);
}

//made a function named draw, draw declares background and lights.
//it also translates my width and height by 2.
//it also shows the sun and it's orbits.
void draw() {
  background(0);
  lights();
  pointLight(255, 255, 255, 0, 0, 0);
  sun.show();
  sun.orbit();
}