Bird b = new Bird(5,250);
PipeSet p;
PImage penguin;
PImage ice;
PImage background;

final float pGap = 150;
final float pWidth = 75;
int counter = 100;
float left, right, top, bottom;
int score = 0;

int highscore = 0;
int lastscore = 0;

final int stateGame  = 0; // consts
final int statePause = 1;
int state = statePause;    // current


void setup(){
  size(500,500); 
  textSize(32);
  b.setY(250);
  b.setVel(-10);
  penguin = loadImage("penguin.png");
  ice = loadImage("ice.png");
  background = loadImage("background.jpg");
  background.resize(500,500);
}

void draw() 
{ 
  switch (state) {
  case stateGame: 
    // Game
    handleStateGame();
    break; 
 
  case statePause:
    // Pause
    handleStatePause(); 
    break;
 
  default:
    // error
    println("Error number 939; unknown state : " + state+".");
    exit();
    break;
  } 
} 

void handleStateGame() {
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
  if (b.checkCollision(p) || b.getY() > 500){
    if (score > highscore)
    {
      highscore = score;
    }
    lastscore = score;
    delay(100);
    counter = 100;
    score = 0;
    state = statePause;
    setup();
  }
  
  left = p.getX() - p.getWidth()/2;
  right = p.getX() + p.getWidth()/2;
  top = p.getHeight() - p.getGap()/2;
  bottom = p.getHeight() + p.getGap()/2;
  
  
  background(background);
  
  pushMatrix();
  imageMode(CENTER);
  translate(b.getX(),b.getY());
  float temp = map(b.getVel(),20,-20,PI/2,-1*PI/2);
  rotate(temp);
  image(penguin, 0,0,penguin.width/10,penguin.height/10);
  popMatrix();
  
  imageMode(CORNERS);
  image(ice, left,0, right,top);
  
  image(ice, left,bottom,right,500);
  
  
  if (abs(b.getX()-p.getX()) < 3){
    score++; 
  }
  fill(255,0,240);
  text(score,250,450);
  delay(33);
}


void handleStatePause() 
{
  background(0);
  textSize(50);
  fill(255);
  text("Game Over", 125, 200);
  textSize(25);
  text("High Score: " + highscore, 160, 250);
  text("Last Run " + lastscore, 170, 300);
  text("Press Any Key to Play again", 100, 350);
  if(mousePressed || keyPressed){
    state = stateGame;
  }
}
