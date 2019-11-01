  int gameScreen = 0;
  
  void ScreensDraw(){
  
  if (gameScreen == 0) {
    initScreen();
  } else if (gameScreen == 1) {
    gameScreen();
  } else if (gameScreen == 2) {
    gameOverScreen();
  }
  
  }
  
 void initScreen() {
  background(bg);
  textAlign(CENTER);
  text("Click to start", height/2, width/2);
} 

void gameScreen() {
  background(bg);
}

void gameOverScreen() {
  background(0);
  textAlign(CENTER);
  fill(255);
  textSize(30);
  text("Game Over", height/2, width/2 - 20);
  textSize(15);
  text("Click to Restart", height/2, width/2 + 10);
}
