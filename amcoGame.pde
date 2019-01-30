boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;

float trabajo1Posy;
float trabajo1Posx;

PImage elGabyImage;
int gabyHeight=80;
int gabyWidth=60;

int xSpeed = 10;
int ySpeed = 10;
float circleX;
float circleY;

RectangleTop[] rectangles = new RectangleTop[100];







void setup(){
  //size(500,500);
  fullScreen();
  smooth();
  frameRate(100);
  elGabyImage=loadImage("gaby.png");
  circleX = width/2;
  circleY = height/2;

  for (int i = 0; i < rectangles.length; ++i) {
    rectangles[i]= new RectangleTop (random(1,5),random(10, 40),random(20,50));    
  }




}

class RectangleTop{
  float x;
  float y;
  float alt;
  float ancho;
  float ySpeed;
  RectangleTop(float ySpeed, float ancho, float alt){
   this.x = random(0, width);
   this.y = 0;
   this.ancho=ancho;
   this.alt=alt;
   
   this.ySpeed=ySpeed;
 
  };
  
  void fall(){
    if(this.y+(this.alt/2)<height){
      this.y+=ySpeed;
    };
  };
  
  void display(){
     rect(this.x,this.y,this.ancho,this.alt);
  };
  
};


void draw() {

  background(400);  
  
  if (upPressed) {
    if(circleY -(gabyHeight/2) >0){
      circleY=circleY-ySpeed;
    }
  }
  
  if (downPressed) {
    if(circleY +(gabyHeight/2)<height){
      circleY=circleY+ySpeed;
    }
  }
  
  if (leftPressed) {
    if (circleX - (gabyWidth/2)>0) {
      circleX=circleX-xSpeed;
    }
  }
  
  if (rightPressed) {
    if (circleX+(gabyWidth/2)<width) {  
      circleX=circleX+xSpeed;
    }
  }
  
 
  for (int i = 0; i < rectangles.length; ++i) {
    rectangles[i].display();
    rectangles[i].fall();
  }
  
  //ellipse(circleX, circleY,gabyWidth,gabyHeight);
  image(elGabyImage,circleX, circleY,gabyWidth,gabyHeight);
}

void keyPressed() {
  if (keyCode == UP) {
    upPressed = true;
  }
  else if (keyCode == DOWN) {
    downPressed = true;
  }
  else if (keyCode == LEFT) {
    leftPressed = true;
  }
  else if (keyCode == RIGHT) {
    rightPressed = true;
  }
}

void keyReleased() {
  if (keyCode == UP) {
    upPressed = false;
  }
  else if (keyCode == DOWN) {
    downPressed = false;
  }
  else if (keyCode == LEFT) {
    leftPressed = false;
  }
  else if (keyCode == RIGHT) {
    rightPressed = false;
  }
}
