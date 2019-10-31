Charater myCharater1;
float x = 300;
float y = 200;
float xspeed = 1;
float yspeed = 3.3;
float Charater = 3;


int maxHealth = 100;
float health = 100;
float healthDecrease = 1;
int healthBarWidth = 60;

void charaterSetup() {
myCharater1 = new Charater(color(255), 50, 490, 50);
  
  
}
void charater () {
 noStroke();
  fill(255);
  x = x + xspeed;
  y = y + yspeed;
  if ((x > width) || (x < 0)) { xspeed = xspeed * -1; }
  if ((y > height) || (y < 0)) { yspeed = yspeed * -1; }
  fill(0, 255, 40);
  
  
  myCharater1.display();

}

class Charater {
  color c;
  float xpaddle;
  float ypaddle;
  float pspeed;
 
  Charater(color tempC, float xpos, float ypos, float padspeed) {
    c = tempC;
    xpaddle = xpos;
    ypaddle = ypos;
    pspeed = padspeed;
  }
 
  void display() {
    stroke(0);
    fill(c);
    rect(xpaddle, ypaddle, 5, 40);
  }
}

void drawHealthBar() {
  // Make it borderless:
  noStroke();
  fill(236, 240, 241);
  rectMode(CORNER);
  rect(   -(healthBarWidth/2),     - 30, healthBarWidth, 5);
  if (health > 60) {
    fill(46, 204, 113);
  } else if (health > 30) {
    fill(230, 126, 34);
  } else {
    fill(231, 76, 60);
  }
  rectMode(CORNER);
  rect(   -(healthBarWidth/2),    - 30, healthBarWidth*(health/maxHealth), 5);
}
void decreaseHealth() {
  health -= healthDecrease;
  if (health <= 0) {
   gameOverScreen();
  }
}
 
void keyPressed() {
  if (key == 'w')  { myCharater1.ypaddle -= Charater; }
  if (key == 's')  { myCharater1.ypaddle += Charater; }
  if (key == 'a')  { myCharater1.xpaddle -= Charater; }
  if (key == 'd')  { myCharater1.xpaddle += Charater; }
  }
