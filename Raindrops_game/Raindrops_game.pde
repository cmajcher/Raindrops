int index = 1;
int oldTime = 0;
int threshold = 1000;
Raindrop[] r = new Raindrop[500000];
Catcher catcher;
int score;
int lives;

void setup() {
  size(800, 800);
  for (int i = 0; i < r.length; i++) {
    r[i] = new Raindrop();
  } 
  catcher = new Catcher();
}

void draw() {
  background(200, 150, 255);
  textSize(50);
  fill(10);
  text(score, 10, 100);
  if (lives<15) {  
    for (int i = 0; i < index; i++) {
      r[i].display();
      r[i].drop();
      if (catcher.catchDrop(r[i]) == true) {
        r[i].goAway();
        fill(random(255), random(255), random(255));
        score++;
        threshold=500;
      }
    }
    catcher.display();
    catcher.update();
    if (millis() - oldTime > threshold) {
      if (index < r.length) {
        index++;
        oldTime = millis();
      }
    }
  }
}

