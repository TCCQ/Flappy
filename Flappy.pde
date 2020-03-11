Bird b = new Bird(5,250);
PipeSet p;
PImage penguin;

final float pGap = 150;
final float pWidth = 75;
int counter = 100;
float left, right, top, bottom;
int score = 0;


void setup(){
  size(500,500); 
  rectMode(CORNERS);
  imageMode(CENTER);
  textSize(32);
  b.setY(250);
  b.setVel(-10);
  penguin = loadImage("penguin.png");
}


void draw(){
  b.tick();
  if (mousePressed || keyPressed){
    b.jump(); 
  }
  if (counter >= 100){
    p = new PipeSet(pGap, (float)((random(1)*300)+150), pWidth);
    counter = 0;  
  } else {
    p.tick();
    counter++;
  }
  if (b.checkCollision(p) || b.getY() > 500 || b.getY() < 0){
    delay(100);
    counter = 100;
    score = 0;
    setup();
  }
  
  left = p.getX() - p.getWidth()/2;
  right = p.getX() + p.getWidth()/2;
  top = p.getHeight() - p.getGap()/2;
  bottom = p.getHeight() + p.getGap()/2;
  
  
  background(0);
  pushMatrix();
  translate(b.getX(),b.getY());
  float temp = map(b.getVel(),20,-20,PI/2,-1*PI/2);
  rotate(temp);
  image(penguin, 0,0,penguin.width/10,penguin.height/10);
  
  popMatrix();
  fill(0,251,255);
  rect(left,0,right,top,0,0,p.getWidth()/5,p.getWidth()/5);
  rect(left,bottom,right,500,p.getWidth()/5,p.getWidth()/5,0,0);
  if (abs(b.getX()-p.getX()) < 3){
    score++; 
  }
  fill(255,0,240);
  text(score,250,450);
  delay(33);
}
