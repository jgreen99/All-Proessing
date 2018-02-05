//this is the class for Frog, as declared in Frogger.
class Frog extends Rectangle {
  
  //I declared a log that is attached and set it to false.
  Log attached = null;
  
  //I declared the Frog function that has 3 parameters: an x, y, and w.
  //The super constructor is also declared under this function.
  Frog(float x, float y, float w) {
    super(x, y, w, w);
  }
  
  //This function checks to see if the log is attached.
  void attach(Log log) {
    attached = log;
  }
  
  //this function updates the frog, as shown in Frogger's draw function.
  void update() {
    if (attached != null) {
      x += attached.speed;
    }

    x = constrain(x, 0, width-w);
  }
  
  //This function shows the frog, as declared in Frogger's draw function.
  void show() {
    fill(0, 255, 0, 200);
    rect(x, y, w, w);
  }
  
  //This function makes the frog move.
  void move(float xdir, float ydir) {
    x += xdir * grid;
    y += ydir * grid;
  }
}