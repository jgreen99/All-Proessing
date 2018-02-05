//this class is for the cars in the game.
class Car extends Rectangle {
  //declared float speed, which has no assigned number to it yet.
  float speed;
  
  //I declared the car function that takes 5 parameters: an x, y, w, h, and s.
  //They are used by the super function.
  //I also assigned speed to the letter s.
  Car(float x, float y, float w, float h, float s) {
    super(x, y, w, h);
    speed = s;
  }

  //this function updates the car, which is declared in Frogger's draw function.
  void update() {
    x = x + speed;
    if (speed > 0 && x > width+grid) {
      x = -w-grid;
    } else if (speed < 0 && x < -w-grid) {
      x = width+grid;
    }
  }
  //this functions shows the car, also declared in Frogger's draw function.
  void show() {
    fill(200);
    rect(x, y, w, h);
  }
}