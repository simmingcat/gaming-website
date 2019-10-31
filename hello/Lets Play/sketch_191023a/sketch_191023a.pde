int gameScreen = 0;

int ballX, ballY;
int ballSize = 20;
int ballColor = color(0);

int racketBounceRate = 20;

float gravity = 1;
float ballSpeedVert = 0;

float airfriction = 0.0001;
float friction = 0.1;

color racketColor = color(0);
float racketWidth = 100;
float racketHeight = 10;

float ballSpeedHorizon = 10;

int wallSpeed = 5;
int wallInterval = 1000;
float lastAddTime = 0;
int minGapHeight = 200;
int maxGapHeight = 300;
int wallWidth = 80;
color wallColors = color(0);

int maxHealth = 100;
float health = 100;
float healthDecrease = 1;
int healthBarWidth = 60;

ArrayList<int[]> walls = new ArrayList<int[]>();

void setup() {
  size(500, 500);

  ballX=width/4;
  ballY=height/5;
}


void draw() {

  if (gameScreen == 0) {
    initScreen();
  } else if (gameScreen == 1) {
    gameScreen();
  } else if (gameScreen == 2) {
    gameOverScreen();
  }
}


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
}

void drawBall() {
  fill(ballColor);
  ellipse(ballX, ballY, ballSize, ballSize);
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

void drawHealthBar() {
  // Make it borderless:
  noStroke();
  fill(236, 240, 241);
  rectMode(CORNER);
  rect(ballX-(healthBarWidth/2), ballY - 30, healthBarWidth, 5);
  if (health > 60) {
    fill(46, 204, 113);
  } else if (health > 30) {
    fill(230, 126, 34);
  } else {
    fill(231, 76, 60);
  }
  rectMode(CORNER);
  rect(ballX-(healthBarWidth/2), ballY - 30, healthBarWidth*(health/maxHealth), 5);
}
void decreaseHealth() {
  health -= healthDecrease;
  if (health <= 0) {
   gameOverScreen();
  }
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

void wallAdder() {
  if (millis()-lastAddTime > wallInterval) {
    int[] randWall = {width, randY, wallWidth, randHeight, 0};
  }
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

void wallAdder() {
  if (millis()-lastAddTime > wallInterval) {
    int randHeight = round(random(minGapHeight, maxGapHeight));
    int randY = round(random(0, height-randHeight));
    // {gapWallX, gapWallY, gapWallWidth, gapWallHeight}
    int[] randWall = {width, randY, wallWidth, randHeight}; 
    walls.add(randWall);
    lastAddTime = millis();
  }
}
void wallHandler() {
  for (int i = 0; i < walls.size(); i++) {
    wallRemover(i);
    wallMover(i);
    wallDrawer(i);
    for (int i = 0; i < walls.size(); i++) {

      watchWallCollision(i);
    }
  }

  }
  void wallDrawer(int index) {
    int[] wall = walls.get(index);
    // get gap wall settings 
    int gapWallX = wall[0];
    int gapWallY = wall[1];
    int gapWallWidth = wall[2];
    int gapWallHeight = wall[3];
    rectMode(CORNER);
    fill(wallColors);
    rect(gapWallX, 0, gapWallWidth, gapWallY);
    rect(gapWallX, gapWallY+gapWallHeight, gapWallWidth, height-(gapWallY+gapWallHeight));
  }
  void wallMover(int index) {
    int[] wall = walls.get(index);
    wall[0] -= wallSpeed;
  }
  void wallRemover(int index) {
    int[] wall = walls.get(index);
    if (wall[0]+wall[2] <= 0) {
      walls.remove(index);
    }
  }

  void watchWallCollision(int index) {
    int[] wall = walls.get(index);
    // get gap wall settings 
    int gapWallX = wall[0];
    int gapWallY = wall[1];
    int gapWallWidth = wall[2];
    int gapWallHeight = wall[3];
    int wallTopX = gapWallX;
    int wallTopY = 0;
    int wallTopWidth = gapWallWidth;
    int wallTopHeight = gapWallY;
    int wallBottomX = gapWallX;
    int wallBottomY = gapWallY+gapWallHeight;
    int wallBottomWidth = gapWallWidth;
    int wallBottomHeight = height-(gapWallY+gapWallHeight);

    if (
      (ballX+(ballSize/2)>wallTopX) &&
      (ballX-(ballSize/2)<wallTopX+wallTopWidth) &&
      (ballY+(ballSize/2)>wallTopY) &&
      (ballY-(ballSize/2)<wallTopY+wallTopHeight)
      ) {
    }

    if (
      (ballX+(ballSize/2)>wallBottomX) &&
      (ballX-(ballSize/2)<wallBottomX+wallBottomWidth) &&
      (ballY+(ballSize/2)>wallBottomY) &&
      (ballY-(ballSize/2)<wallBottomY+wallBottomHeight)
      ) {
    }
  }

  void watchWallCollision(int index) {
    ...
      int wallScored = wall[4];
    ...
      if (ballX > gapWallX+(gapWallWidth/2) && wallScored==0) {
      wallScored=1;
      wall[4]=1;
      score();
    }
  }
  void score() {
    score++;
  }
  void printScore() {
    textAlign(CENTER);
    fill(0);
    textSize(30); 
    text(score, height/2, 50);
  }


  public void mousePressed() {

    if (gameScreen==0) {
      startGame();

      if (gameScreen==2) {
        restart();
      }
    }
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
