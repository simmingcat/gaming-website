void makeBounceLeft(int surface) {
  ballX = surface+(ballSize/2);
  ballSpeedHorizon*=-1;
  ballSpeedHorizon -= (ballSpeedHorizon * friction);
}

void makeBounceRight(int surface) {
  ballX = surface-(ballSize/2);
  ballSpeedHorizon*=-1;
  ballSpeedHorizon -= (ballSpeedHorizon * friction);
}


void watchRacketBounce() {
  float overhead = mouseY - pmouseY;
  if ((ballX+(ballSize/2) > mouseX-(racketWidth/2)) && (ballX-(ballSize/2) < mouseX+(racketWidth/2))) {
    if (dist(ballX, ballY, ballX, mouseY)<=(ballSize/2)+abs(overhead)) {
      makeBounceBottom(mouseY);
      // racket moving up
      if (overhead<0) {
        ballY+=overhead;
        ballSpeedVert+=overhead;

        if ((ballX+(ballSize/2) > mouseX-(racketWidth/2)) && (ballX-(ballSize/2) < mouseX+(racketWidth/2))) {
          if (dist(ballX, ballY, ballX, mouseY)<=(ballSize/2)+abs(overhead)) {

            ballSpeedHorizon = (ballX - mouseX)/5;
          }
        }
      }
    }
  }
}

void applyGravity() {
  ballSpeedVert += gravity;
  ballY += ballSpeedVert;

  ballSpeedVert -= (ballSpeedVert * airfriction);
}

void makeBounceBottom(int surface) {
  ballY = surface-(ballSize/2);
  ballSpeedVert*=-1;

  ballSpeedVert -= (ballSpeedVert * friction);
}
void makeBounceTop(int surface) {
  ballY = surface+(ballSize/2);
  ballSpeedVert*=-1;
}
