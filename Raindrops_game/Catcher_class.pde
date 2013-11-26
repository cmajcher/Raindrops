Ball[] balls = new Ball[5];
PVector mouse;

void setup() {
  size(500, 500);
  mouse = new PVector(width/2, height/2);  //This PVector will be the point the balls interact with
  colorMode(HSB, 360, 100, 100);
  for (int i = 0; i < balls.length; i++) {
    balls[i] = new Ball();
  }
}
void draw() {
  mouse.set(mouseX, mouseY);
  background(0, 0, 100);
  for (int i = 0; i < balls.length; i++) {
    balls[i].display();
    balls[i].move();
    balls[i].edgeBounce();
    for (int j = 0; j < balls.length; j++) {  //use a for loop to iterate through the entire array again
      if (i!=j) {  //don't check if you'd be checking a ball against itself
        balls[i].ballCheck(balls[j]);  //call the ballCheck function, telling it to check against each other Ball
      }
    }
  }
}

