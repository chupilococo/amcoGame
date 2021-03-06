boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;
boolean gameOver= false;
boolean gameWined=false;
String  tareas[] = {
  "Maquinas Virtuales",
  "La red Esta lenta",
  "Te Llaman de Mexico",
  "Cuales son los puertos del FTP",
  "No anda el OWA"
};

Player gaby = new Player();

ArrayList<RectangleTop> rectangles = new ArrayList<RectangleTop>();

class RectangleTop{
  float x;
  float y;
  float alt;
  float ancho;
  float ySpeed;
  String msg;
  boolean tocado = false;
  RectangleTop(float ySpeed, float alt,String msg){
   this.x = random(0, width);
   this.y = 600;
   this.ancho=textWidth(msg)+10;
   this.alt=alt;   
   this.ySpeed=ySpeed;
   this.msg=msg;
  };
  void fall(){
    if(this.y+(this.alt/2)<height){
      this.y+=ySpeed;
    };
  };
  void display(){
    if(tocado){
      fill(255,0,0);
    }
     text(this.msg,this.x+5,this.y+this.alt/2+10); 
     rect(this.x,this.y,this.ancho,this.alt);
     noFill();
     //println(this.msg);
  };
};


class Player{
  PImage image;
  int height=80;
  int width=60;
  int xSpeed = 5;
  int ySpeed = 5;
  float circleX;
  float circleY;
  
  boolean checkColision(RectangleTop rect){
    
    boolean resp = false;
    
    float bttomPos = this.circleY+(this.height/2);
    float topPos = this.circleY-(this.height/2);
    float leftPos =this.circleX-(this.width/2);
    float rightPos =this.circleX+(this.width/2);

    float objBttomPos   = rect.y+(rect.alt/2);
    float objTopPos     = rect.y-(rect.alt/2);
    float objLeftPos    = rect.x-(rect.ancho/2);
    float objRightPos   = rect.x+(rect.ancho/2);
    
    
    
      //rect.tocado=true;
      resp=true;
      return resp;
  }
}



void setup(){
  fullScreen();
  smooth();
  textSize(34);
  noFill();
  //frameRate(60);
  rectangles.add(new RectangleTop (random(1,5),random(20,50),tareas[4]));
  gaby.image=loadImage("gaby.png");
  gaby.circleX = width/2;
  gaby.circleY = height/2;
}



void draw() {

  background(400);  
  
  if (upPressed) {
    if(gaby.circleY -(gaby.height/2) >0){
      gaby.circleY=gaby.circleY-gaby.ySpeed;
    }
  }
  
  if (downPressed) {
    if(gaby.circleY +(gaby.height/2)<height){
      gaby.circleY=gaby.circleY+gaby.ySpeed;
    }
  }
  
  if (leftPressed) {
    if (gaby.circleX - (gaby.width/2)>0) {
      gaby.circleX=gaby.circleX-gaby.xSpeed;
    }
  }
  
  if (rightPressed) {
    if (gaby.circleX+(gaby.width/2)<width) {  
      gaby.circleX=gaby.circleX+gaby.xSpeed;
    }
  }
  
  //if(frameCount%60==0){
  //  //println("entro al if");
  //  if(!gameOver){
  //    int idx=int(random(tareas.length));
  //    rectangles.add(new RectangleTop (random(1,5),random(10, 40),random(20,50),tareas[idx]));
  //  }
  //}
  for (int i = 0; i < rectangles.size(); ++i) {
    rectangles.get(i).display();
    
    if(!gameOver){
      //rectangles.get(i).fall();
    }

    if(gaby.checkColision(rectangles.get(i))){
       gameOver=true;
    }
  }
  ellipse(gaby.circleX, gaby.circleY,gaby.width,gaby.height);
  stroke(0,255,0);
  noFill();
  rect(gaby.circleX-gaby.width/2, gaby.circleY-gaby.height/2, gaby.width, gaby.height);
  //image(gaby.image,gaby.circleX-gaby.width/2, gaby.circleY-gaby.height/2,gaby.width,gaby.height);
  //fill(153);
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
