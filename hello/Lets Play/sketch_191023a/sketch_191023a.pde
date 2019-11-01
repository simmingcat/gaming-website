int gameScreen = 0;

int ballX, ballY;
int ballSize = 20;
int ballColor = color(0);

int racketBounceRate = 20;

float gravity = 1;
float ballSpeedVert = 15;

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

int score = 0;


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
