void initScreen() {
  background(0);
  textAlign(CENTER);
  text("Click to start", height/2, width/2);
}

void gameScreen() {
  background(255);
  drawBall();
  applyGravity();
  keepInScreen();
  drawRacket();
  watchRacketBounce();
  applyHorizontalSpeed();
  wallAdder();
  wallHandler();
  drawHealthBar();
   printScore();
}

void drawBall() {
  fill(ballColor);
  ellipse(ballX, ballY, ballSize, ballSize);
}


void keepInScreen() {

  if (ballY+(ballSize/2) > height) { 
    makeBounceBottom(height);
  }

  if (ballY-(ballSize/2) < 0) {
    makeBounceTop(0);

    if (ballX-(ballSize/2) < 0) {
      makeBounceLeft(0);
    }
    if (ballX+(ballSize/2) > width) {
      makeBounceRight(width);
    }
  }
}

void drawRacket() {
  fill(racketColor);
  rectMode(CENTER);
  rect(mouseX, mouseY, racketWidth, racketHeight);
}

void applyHorizontalSpeed() {
  ballX += ballSpeedHorizon;
  ballSpeedHorizon -= (ballSpeedHorizon * airfriction);
}



  public void mousePressed() {

    if (gameScreen==0) {
      startGame();

      if (gameScreen==2) {
        restart();
      }
    }
  }
