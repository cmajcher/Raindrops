int index = 1; 
int oldTime = 0; 
int threshold = 1000; 
Raindrop[] r = new Raindrop[500000]; 
Catcher catcher; 
int score; 
int lives; 
boolean start=false; 
boolean end = false; 
void setup() { background(0); 
size(800, 800); 
for (int i = 0; i < r.length; i++) { 
r[i] = new Raindrop(); } 
catcher = new Catcher(); } 
void draw() { 
if (start==true && end == false) { 
background(91, 165, 67); 
textSize(50); fill(10); 
text(score, 60, 100); 
if (lives<15) { 
for (int i = 0; i < index; i++) { 
r[i].display(); 
r[i].drop(); 
if (catcher.catchDrop(r[i]) == true) { 
//r[i].goAway(); 
fill(random(255), random(255), random(255)); 
score++; 
threshold=500; 
if (lives==15) { 
fill(155, 200, 30); 
textSize(50); 
textAlign(CENTER); 
text("GAME OVER ", width/2, height/2); }
} 
} 
catcher.display(); catcher.update(); 
if (millis() - oldTime > threshold) { 
if (index < r.length) { index++; oldTime = millis(); } 
} 
} 
else { end = true; start = false; 
} 
} 
if (start==false && end == false) { 
fill(155, 200, 30); 
textSize(50); 
textAlign(CENTER); 
text("PRESS MOUSE TO START", width/2, height/2); 
} 
if(start == false && end == true) { 
background(0); 
fill(155,200,30); 
textSize(50); 
textAlign(CENTER); 
text("GAME OVER ",width/2,height/2); 
} 
} 
void mousePressed() { 
start=true; 
}
