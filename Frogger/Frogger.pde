//Declared class variables.
Frog frog;
Car[] cars;
Log[] logs;

//declared a grid that equals 50.
float grid = 50;

//this functions resets the game if the frog hits a car.
void resetGame() {
  frog = new Frog(width/2-grid/2, height-grid, grid);
  frog.attach(null);
}

//this function sets up the game from declaring the size and calls functions.
//it also sets the cars and the logs.
void setup() {
  size(500, 500);
  //frog = new Frog(width/2-grid/2, height-grid, grid);
  resetGame();

  int index = 0;
  cars = new Car[8];

  // ROW 1
  for (int i = 0; i < 2; i++) {
    float x = i * 300;
    cars[index] = new Car(x, height-grid*2, grid*2, grid, 2);
    index++;
  }

  // ROW 2
  for (int i = 0; i < 2; i++) {
    float x = i * 200 + 150;
    cars[index] = new Car(x, height-grid*3, grid, grid, -3.5);
    index++;
  }

  // ROW 3
  for (int i = 0; i < 4; i++) {
    float x = i * 150 + 25;
    cars[index] = new Car(x, height-grid*4, grid, grid, 1.2);
    index++;
  }

  logs = new Log[7];

  // ROW 5
  index = 0;
  for (int i = 0; i < 2; i++) {
    float x = i * 250 + 100;
    logs[index] = new Log(x, height-grid*6, grid*3, grid, 2.3);
    index++;
  }
  // ROW 6
  for (int i = 0; i < 3; i++) {
    float x = i * 200 + 30;
    logs[index] = new Log(x, height-grid*7, grid*2, grid, -1.3);
    index++;
  }
  // ROW 7
  for (int i = 0; i < 2; i++) {
    float x = i * 400 + 10;
    logs[index] = new Log(x, height-grid*8, grid*4, grid, 0.5);
    index++;
  }
}

//this function draws the game out and also calls functions down.
//The background, fill and 3 rectangles are drawn out.
//I also added a complex for statement.
void draw() {
  background(0);
  fill(255, 100);
  rect(0, 0, width, grid*2);
  rect(0, height-grid, width, grid);
  rect(0, height-grid*5, width, grid);
  for (Car car : cars) {
    car.show();
    car.update();
    if (frog.intersects(car)) {
      resetGame();
      //println("GAME OVER");
    }
  }

  for (Log log : logs) {
    log.show();
    log.update();
  }

  if (frog.y < height-grid*5 && frog.y > grid*2) {
    boolean ok = false;
    for (Log log : logs) {
      if (frog.intersects(log)) {
        ok = true;
        frog.attach(log);
      }
    }
    if (!ok) {
      resetGame();
    }
  } else {
    frog.attach(null);
  }

  frog.update();
  frog.show();
}

//this function controls what keys are used to move the frog.
void keyPressed() {

  if (keyCode == UP) {
    frog.move(0, -1);
  } else if (keyCode == DOWN) {
    frog.move(0, 1);
  } else if (keyCode == RIGHT) {
    frog.move(1, 0);
  } else if (keyCode == LEFT) {
    frog.move(-1, 0);
  }
}