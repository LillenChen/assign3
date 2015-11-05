/* please implement your assing code in this file.*/
final float wx = 2.00;
PImage img;
PImage enemy;
PImage fighter;
PImage hp;
PImage treasure;
PImage bg1;
PImage bg2;
PImage end1;//shine
PImage end2;
PImage start1;//shine
PImage start2;
//PImage Moocs-element-enemy1;


boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;
boolean xecrash,yecrash = false;
boolean endbgX, endbgY;

int c;
int speed=6;
int bg1x;
int bg2x;
int xt;
int yt;
int w_;
int x3;
int y3;
int state = 1;
int xteat,yteat;
int xe,ye;
final int COUNT = 5;
void setup () {
  size(640, 480) ;
  // loadImage
  bg1 = loadImage("img/bg1.png");
  bg2 = loadImage("img/bg2.png");
  end1 = loadImage("img/end1.png");
  end2 = loadImage("img/end2.png");
  enemy = loadImage("img/enemy.png");
  fighter = loadImage("img/fighter.png");
  hp = loadImage("img/hp.png");
  start1 = loadImage("img/start1.png");
  start2 = loadImage("img/start2.png");
  treasure = loadImage("img/treasure.png");
  bg1x = 0;
  bg2x = -640;
  xt = floor(random(160,550));
  yt = floor(random(50,390));
  x3 = 480;
  y3 = floor(random(120,360));
  w_ = 100;
  c = 0;
}
void draw() {
  switch(state){
    case 1 :   // start
      boolean startbgX = false;
      boolean startbgY = false;
      if (mouseX>200 && mouseX<460){startbgX = true;}
      if (mouseY>375 && mouseY<420){startbgY = true;}
      if (startbgX == true && startbgY == true){
        image(start1,0,0);
        if (mousePressed){state = 2;}
      }else{image(start2,0,0);}
      break;
    case 2 :   //playing
      // bakground
      image(bg1,bg1x,0);
      image(bg2,bg2x,0);
      bg1x += 1;
      bg2x += 1;
      if (bg1x == 640){bg1x = -640;}
      if (bg2x == 640){bg2x = -640;}
      // hp
      fill(255,0,0);
      rect(48,44,w_*wx,22);
      image(hp,40,40);
      if (w_ < 5){state = 3;}
      // treasure
      image(treasure,xt,yt);
      if (x3 > (xt-30) && x3 < (xt+80)){
        xteat = 1;
      }else{xteat = 0;}
      if (y3 > (yt-30) && y3 < (yt+80)){
        yteat = 1;
      }else{yteat = 0;}
      if (xteat == 1 && yteat == 1){
        xt = floor(random(160,550));
        yt = floor(random(50,390));
        if (w_ <= 90){w_ += 10;}
      }
      //fighter
     image(fighter,x3,y3);
    if (upPressed) {
      if (y3 >0)
      y3 -= speed;  
    }  
    if (downPressed) {
      if (y3 < 427)
      y3 += speed;
    }
    if (leftPressed) {
      if (x3 > 0)
      x3 -= speed;
       }
    if (rightPressed) {
      if (x3 < 590)
      x3 += speed; 
    }
  //enemy
//enemy
      int a,b; a=1;b=1;
      



if(c==0)
{
  for(int i=0;i<5;i++){
  image (enemy,xe-70*i,170);
  }
  xe %= 930;
  if (xe >1000){ye = 180;}
  xe += 5;
//  enemyY += 0.02*(fighterY-enemyY+25);
  if(xe>910){c=1;}
}
if(c==1)
{
  for(int j=0;j<5;j++){
  image (enemy,xe-70*j,100+70*j);
  }
  xe %= 930;
  if (xe >1000){ye = 100;}
  xe += 5;
//enemyY += 0.02*(fighterY-enemyY+25);
if(xe>910){c=2;}
}
  
if(c==2){
  for(int k=0;k<3;k++)
  {
    image (enemy,xe-70*k,100+70*k);
  }
  for(int k=1;k<3;k++)
  {
    image (enemy,xe+70*k,100+70*k);
  }
  
    image (enemy,xe,100+70*4);
  
  image (enemy,xe-70,100+70*3);
  image (enemy,xe+70,100+70*3);
    xe %= 930;
    if (xe >1000){ye = 100;}
    xe += 5;
    //enemyY += 0.02*(fighterY-enemyY+25);
    if(xe>910){c=0;}
  }
     
     /* if (enemyX-fighterX > -50 && enemyX-fighterX < 50 ){
        enemyXcrash = true;
      }else{enemyXcrash = false;}
      if (enemyY-fighterY > -50 && enemyY-fighterY < 50 ){
        enemyYcrash = true;
      }else{enemyYcrash = false;}
      if (enemyXcrash && enemyYcrash){
        enemyX = -10;
        hp_ -= 20;
        fighterX = 480;
        fighterY = floor(random(120,360));
      }*/
  
      break;
    case 3 : // end
      boolean endbgX = false;
      boolean endbgY = false;
      if (mouseX>200 && mouseX<440){endbgX = true;}
      if (mouseY>310 && mouseY<350){endbgY = true;}
      if (endbgX == true && endbgY == true){
        image(end1,0,0);
        if (mousePressed){
          state = 2;
          w_ = 20;
          xe = 0;
          xt = 575;
          yt = 240;
        }
      }else{
        image(end2,0,0);
      }
      w_ = 20;
      xe = 0;
      x3 = 500;
      y3 = floor(random(120,360));
  }
}
void keyPressed(){
  if (key == CODED) { 
    switch (keyCode) {
      case UP:
        upPressed = true;
        break;
      case DOWN:
        downPressed = true;
        break;
      case LEFT:
        leftPressed = true;
        break;
      case RIGHT:
        rightPressed = true;
        break;
    }
  }
}
void keyReleased(){
  if (key == CODED) {
    switch (keyCode) {
      case UP:
        upPressed = false;
        break;
      case DOWN:
        downPressed = false;
        break;
      case LEFT:
        leftPressed = false;
        break;
      case RIGHT:
        rightPressed = false;
        break;
    }
  }
}
