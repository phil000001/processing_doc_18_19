//POngTATO, Homework day 3
//Philipp Dollinger
//Just imagine being on a potato field having the time of your life. 
//Control: left Player: SHIFT=up & ALT=down – right Player: UP=up & DOWN=down



float spielerx;
float spielery;
float spieler2x;
float spieler2y;
float ballx;
float bally;
float ballgeschwx;
float ballgeschwy;
PImage pot;
PImage field;
int runde;


void setup() {
  spielerx = 20;
  spielery = 60;
  spieler2x = 780;
  spieler2y = 60;
  ballx = 400;
  bally = 300;
  ballgeschwx = -4;
  ballgeschwy = 0;
  runde = 0;
  size(800, 600);
  rectMode(CENTER);
  pot = loadImage ("patata.png");
  field = loadImage ("field.png");
  imageMode(CENTER);
}

void draw() {
  background(field);
  rect(spielerx, spielery, 20, 100);
  rect(spieler2x, spieler2y, 20, 100);
  
  image(pot, ballx, bally, 50, 50);

  //rect(ballx,bally, 10, 10);
  if(keyPressed){
    if(keyCode == ALT){
      if(spielery < 550){
    spielery = spielery + 5; 
      }
  } 
  if(keyCode == SHIFT){
    if(spielery > 50){
    spielery = spielery - 5;
      }
    }
    if(keyCode == DOWN){
      if(spieler2y < 550){
    spieler2y = spieler2y + 5;
      }
    }
    if(keyCode == UP){
      if(spieler2y > 50){
    spieler2y = spieler2y - 5;
      }
    }
  }
  ballx = ballx + ballgeschwx;
  bally = bally + ballgeschwy;
  
  
  // PLAYER 1
  
  if(ballx < 30){
    if(bally < (spielery + 55) && bally > (spielery -55)){
      ballgeschwx = (-ballgeschwx) + 1;
      ballgeschwy = ballgeschwy - (spielery - bally) * 0.1;
      runde = runde + 1;
    }else{
      ballx = 400;
      bally = 300;
      ballgeschwx = -4;
      ballgeschwy = 0;
      runde = 0;
    }
  }
  if(bally > 595 || bally < 5){
    ballgeschwy = -ballgeschwy;
  }
  if(ballx > 795){
    ballgeschwx = -ballgeschwx;
   
  }
  
  
  //PLAYER 2
  
    if(ballx > 770){
    if(bally < (spieler2y + 755) && bally > (spieler2y -755)){
      ballgeschwx = (-ballgeschwx) + 1;
      ballgeschwy = ballgeschwy + (spieler2y - bally) * 0.1;
      runde = runde + 1;
    }else{
      ballx = 400;
      bally = 300;
      ballgeschwx = -4;
      ballgeschwy = 0;
      runde = 0;
    }
  
    } 
  
  
  
  
  
  text("potatoes: " + runde, 420, 20);
  fill(20);
}
