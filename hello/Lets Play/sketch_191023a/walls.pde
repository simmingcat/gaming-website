void wallAdder() {
  if (millis()-lastAddTime > wallInterval) {
    int randHeight = round(random(minGapHeight, maxGapHeight));
    int randY = round(random(0, height-randHeight));
   
    int[] randWall = {width, randY, wallWidth, randHeight}; 
    walls.add(randWall);
    lastAddTime = millis();
    
     if (millis()-lastAddTime > wallInterval) {
     }
  }
}
void wallHandler() {
  for (int i = 0; i < walls.size(); i++) {
    wallRemover(i);
    wallMover(i);
    wallDrawer(i);
      watchWallCollision(i);
    }
  }

  void wallDrawer(int index) {
    int[] wall = walls.get(index);
    
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
    int wallScored = wall[3];
     
      if (ballX > gapWallX+(gapWallWidth/2) && wallScored==0) {
      wallScored=1;
      wall[3]=1;
       score();
      
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
  }
