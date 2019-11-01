 
 void gameOverScreen() {
background(44, 62, 80);
  textAlign(CENTER);
  fill(236, 240, 241);
  textSize(12);
  text("Your Score", width/2, height/2 - 120);
  textSize(130);
  text(score, width/2, height/2);
  textSize(15);
  text("Click to Restart", width/2, height-30);
}
 
 void restart() {
    score = 0;
    health = maxHealth;
    ballX=width/4;
    ballY=height/5;
    lastAddTime = 0;
    walls.clear();
    gameScreen = 0;
  }

  void startGame() {
    gameScreen=1;
  }
