Charater myCharater1;
float x = 300;
float y = 200;
float xspeed = 1;
float yspeed = 3.3;
float paddleSpeed = 3;


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
 
void keyPressed() {
  if (key == 'w')  { myCharater1.ypaddle -= paddleSpeed; }
  if (key == 's')  { myCharater1.ypaddle += paddleSpeed; }
  if (key == 'a')  { myCharater1.xpaddle -= paddleSpeed; }
  if (key == 'd')  { myCharater1.xpaddle += paddleSpeed; }
  }
