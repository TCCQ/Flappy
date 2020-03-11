Bird b = new Bird(5,250);
PipeSet p;

final float pGap = 200;
final float pWidth = 75;
int counter = 100;
float left, right, top, bottom;

void setup(){
  size(500,500); 
  rectMode(CORNERS);
  b.setY(250);
  b.setVel(-10);
}


void draw(){
  b.tick();
  if (mousePressed){
    b.jump(); 
  }
  if (counter >= 100){
    p = new PipeSet(pGap, (float)((random(1)*300)+150), pWidth);
    counter = 0;  
  } else {
    p.tick();
    counter++;
  }
  if (b.checkCollision(p)){
    delay(100);
    counter = 100;
    setup(); 
  }
  
  left = p.getX() - p.getWidth()/2;
  right = p.getX() + p.getWidth()/2;
  top = p.getHeight() - p.getGap()/2;
  bottom = p.getHeight() + p.getGap()/2;
  
  
  background(0);
  fill(255,0,0);
  circle(b.getX(),b.getY(), 50);
  fill(0,255,0);
  rect(left,0,right,top);
  rect(left,bottom,right,500);
  delay(33);
}
