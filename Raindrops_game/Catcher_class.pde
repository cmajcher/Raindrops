class Catcher {
  PVector loc;
  PVector vel;
  int d;
  int x;


  Catcher() {
    d = 75;
    vel = new PVector(12, 0);
    loc = new PVector(d, height-2*d);
  }

  void display() {
    fill(255);
    ellipse(loc.x, loc.y, d, d);
  }

  void update() {
    loc.x=mouseX;
  }
  boolean catchDrop(Raindrop drop) {
    if (loc.dist(drop.loc) < d/2 + drop.d/2) {
      drop.colorChange();
      return true;
    }
    else {
      return false;
    }
  }
}
