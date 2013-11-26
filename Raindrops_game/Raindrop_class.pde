class Ball {
  PVector loc, vel;
  int d;
  color c;

  Ball() {
    loc = new PVector(random(width), random(height));
    vel = PVector.random2D();
    d = 80;
    c = color(random(360), 100, 100);
  }

  void display() {
    fill(c, 100);
    stroke(c);
    strokeWeight(4);
    ellipse(loc.x, loc.y, d, d);
  }

  void move() {
    loc.add(vel);
  }
  //I made edgeBounce its own method in case I want to add other functionality when the balls hit the edge
  //Having this already pulled into its own function makes it easy to identify when balls hit the edge
  void edgeBounce() {
    if (loc.x > width) {
      vel.x = -abs(vel.x);
    } 
    if (loc.x < 0) {
      vel.x = abs(vel.x);
    }
    if (loc.y > height) {
      vel.y = -abs(vel.y);
    } 
    if (loc.y < 0) {
      vel.y = abs(vel.y);
    }
  }

  //Now I am modifying this to check for another ball
  void ballCheck(Ball b) {  //I pass in one argument - an object of the ball class
    if (loc.dist(b.loc) < d/2 + b.d/2) {  //Check to see if the distance between the centers of the circles is less than the radii of the circles
      //instead of changing colors, balls get a random velocity
      vel = PVector.random2D();
      b.vel = PVector.random2D();
    }
  }
}

