PImage pic;

void setup(){
size(1920,1080);

 pic=loadImage("6-vector-game-backgrounds-8003_imgs_8003_2.png");
   rect(1820,1180, 1,1);
  image(pic,1820,1180, 1,1);
}

void draw(){
  charater();
  background();
  
}
