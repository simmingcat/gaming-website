Paddle myPaddle1;
Paddle myPaddle2;
float x = 300;
float y = 200;
float xspeed = 1;
float yspeed = 3.3;
float paddleSpeed = 3;


void charaterSetup() {
myPaddle1 = new Paddle(color(255), 500, 500, 500);
  
  
}
void charater () {
 noStroke();
  fill(255);
  x = x + xspeed;
  y = y + yspeed;
  if ((x > width) || (x < 0)) { xspeed = xspeed * -1; }
  if ((y > height) || (y < 0)) { yspeed = yspeed * -1; }
  fill(0, 255, 40);
  
  
  myPaddle1.display();

}

class Paddle {
  color c;
  float xpaddle;
  float ypaddle;
  float pspeed;
 
  Paddle(color tempC, float xpos, float ypos, float padspeed) {
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
  if (key == 'w')      { myPaddle1.ypaddle -= paddleSpeed; }
  if (key == 's')      { myPaddle1.ypaddle += paddleSpeed; }
  if (key == 'a')   { myPaddle1.xpaddle -= paddleSpeed; }
  if (key == 'd') { myPaddle1.xpaddle += paddleSpeed; }
}
