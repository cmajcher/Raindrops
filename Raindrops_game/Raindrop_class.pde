class Raindrop {
  PVector loc, vel, acc;
  int d;
  color c;
  boolean miss;
  boolean caught;
  Raindrop() {
    d = 10;
    loc = new PVector(random(width), -d); 
    vel = new PVector(0, random(1, 2));
    acc = new PVector(0, .01);
  }

  void display() {
    fill(c);
    noStroke();
    if (miss)
    {
      loc.set(1000, -200);
    }
    ellipse(loc.x, loc.y, d, d);
    triangle(loc.x-(d/2)-(vel.x*10), loc.y, loc.x+(d/2)+(vel.x*10), loc.y, loc.x, loc.y-(vel.y*10));
  }
  void drop() {

    vel.add(acc);
    loc.add(vel);
    if (miss || caught)
    {
      loc.set(1000, -200);
    }
    if (loc.y>800) {
      loc.x=1000;
      loc.y=-200;
      acc.set(0, 0);
      vel.set(0, 0);
      lives++;
    }
  }
  void reset() {
    loc.set( random(width), 0);
    vel.set(0, random(1, 3));
    if (miss || caught)
    {
      loc.set(1000, -200);
    }
  }

  void goAway() {
    vel.set(0, 0);
    acc.set(random(-5, 5), random(-5, 5));
    if (miss || caught)
    {
      loc.set(1000, -200);
    }
  }
  void colorChange() {
    c = color(random(50, 150), random(50, 150), random(50, 150));
  }
}


