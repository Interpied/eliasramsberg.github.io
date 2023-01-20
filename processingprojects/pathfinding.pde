// create an array of Flag objects
ArrayList<Flag> theFlags = new ArrayList<Flag>();
ArrayList<Mine> theMines = new ArrayList<Mine>();
ArrayList<TempScoreText> tempScoreTexts = new ArrayList<TempScoreText>();

// keep track of how many Flags we have already created
int maxFlags = 100000;
int numFlags = 0;
int currentFlag = 0;

int maxMines = 1000;
int numMines = 0;
int currentMine = 0;

/* removed the class block and any import statements */

// create an array of ball objects
Ball [] theBalls = new Ball[100];

// keep track of how many balls we have already created
int maxBalls = 1000;
int numBalls = 0;
int currentBall = 0;
float shipSize = 20;
float shipSpeed = 1000;
float shipSpeedIdle = 500;

PVector shipPos = new PVector(0, 0);
PVector dir = new PVector(0, 0);

float safeScore;
float score;
float scoreMultiplier = 3;
boolean showTempScore;
boolean fadeScore;

//float redrawPointsDelay;

void setup() {
  size (960, 540);
  noStroke();

  shipPos.x = width / 2;
  shipPos.y = height / 2;
  shipSpeed /= 1000;
  shipSpeedIdle /= 1000;
  scoreMultiplier /= 10000;
  
  dir = new PVector(shipPos.x, shipPos.y);
  dir.normalize();

  theMines.add(new Mine(this, random(0, width), random(0, height)));
  theMines.add(new Mine(this, random(0, width), random(0, height)));
  theMines.add(new Mine(this, random(0, width), random(0, height)));
}

void mousePressed() {
  theFlags.add(new Flag(this, mouseX, mouseY));
  if (theFlags.size() == 1) tempScoreTexts.add(new TempScoreText(this));
}

void draw()
{
  // clear background
  background(37, 150, 250);

  // move and draw all Flags that have been created

  for (int i = 0; i < theFlags.size(); i++)
  {
    theFlags.get(i).drawLine(i);
  }

  for (int i = 0; i < theFlags.size(); i++)
  {
    theFlags.get(i).fade();
    theFlags.get(i).move();
    theFlags.get(i).display();
  }


  /////////////////////////////////////////
  ////////// BALLLLLLLLSSSSSS /////////////
  /////////////////////////////////////////

  // create a ball at this position
  theBalls[ currentBall ] = new Ball(this, shipPos.x, shipPos.y);

  // increase to keep track of the next ball
  currentBall++;

  // also increase our total balls used, if necessary
  if (numBalls < theBalls.length)
  {
    numBalls++;
  }

  // did we just use our last slot? if so, we can reuse old slots
  if (currentBall >= theBalls.length)
  {
    currentBall = 0;
  }
  
  // move and draw all balls that have been created
  for (int i = 0; i < numBalls; i++)
  {
    theBalls[i].fade();
    theBalls[i].move();
    theBalls[i].display();
  }

  // move and draw all balls that have been created
  for (int i = 0; i < theMines.size(); i++)
  {
    theMines.get(i).move();
    theMines.get(i).display();
    theMines.get(i).checkCollision();
  }

  //  draw boat  //

  if (theFlags.size() > 0) moveBoat();
  else moveIdle();
  
  drawBoat();
  bounceBoat();
  
  calculateScore();
}

void moveBoat() {
  dir = new PVector(theFlags.get(0).x - shipPos.x, theFlags.get(0).y - shipPos.y);
  dir.normalize();
  shipPos.x += dir.x * shipSpeed;
  shipPos.y += dir.y * shipSpeed;
  
  //  REMOVE FLAG IF TOO CLOSE  //
  while(dist(shipPos.x, shipPos.y, theFlags.get(0).x, theFlags.get(0).y) < shipSpeed){
        theFlags.remove(0);
        if (theFlags.size() == 0) {
          tempScoreTexts.get(tempScoreTexts.size()-1).fadeScoreBool = true;
          break;
        }
  }
}

void moveIdle() {

  float dirChangeX = random(-1, 1);
  dirChangeX /= 10;
  
  float dirChangeY = random(-1, 1);
  dirChangeY /= 10;
  
  dir.x += dirChangeX;
  dir.y += dirChangeY;
  
  dir.normalize();
  
  shipPos.x += dir.x * shipSpeedIdle;
  shipPos.y += dir.y * shipSpeedIdle;
}

void drawBoat() {
  fill(20, 20, 100, 255);
  ellipse(shipPos.x, shipPos.y, shipSize, shipSize);
}

void bounceBoat(){
    // bounce
    if (shipPos.x > width)
    {
      shipPos.x = width;
      dir.x *= -1;
    }
    if (shipPos.y > height)
    {
      shipPos.y = height;
      dir.y *= -1;
    }
    if (shipPos.x < 0)
    {
      shipPos.x = 0;
      dir.x *= -1;
    }
    if (shipPos.y < 0)
    {
      shipPos.y = 0;
      dir.y *= -1;
    }
}

void gameOver() {
  score = 0;
  for (int i = 0; i < theFlags.size(); i++){
    theFlags.remove(0);
  }
  
  fadeScore = false;
  tempScoreTexts.clear();
  safeScore = 0;
}

void calculateScore(){
  float plannedTravelDistance = 0;
  
  //calculate the amount of distance already planned ahead for
  for (int i = 0; i < theFlags.size(); i++){
    if (i == 0) plannedTravelDistance += dist(shipPos.x, shipPos.y, theFlags.get(i).x, theFlags.get(i).y);
    else {
      plannedTravelDistance += dist(theFlags.get(i).x, theFlags.get(i).y, theFlags.get(i - 1).x, theFlags.get(i - 1).y);
    }
  }

  // add to myscore of last TempScoreText
  if (tempScoreTexts.size() > 0) {
    tempScoreTexts.get(tempScoreTexts.size() - 1).myScore += plannedTravelDistance * scoreMultiplier;
  }
 
  textAlign(RIGHT);
  textSize(60);
  fill(0, 408, 200);
  text(round(safeScore), width - 20, 55);

  //  issue //
  for (int i = 0; i < tempScoreTexts.size(); i++){

    tempScoreTexts.get(i).display();
    tempScoreTexts.get(i).fadeScore();
  }
}

class Flag
{
  // instance vars
  private float x;
  private float y;
  private float myRed;
  private float myGreen;
  private float myBlue;
  private float myAlpha;

  // store a reference to the canvas
  private PApplet canvas;


  Flag(PApplet canvas, float x, float y)
  {
    // store a ref to the canvas
    this.canvas = canvas;

    // store x and y
    this.x = x;
    this.y = y;

    // randomize our color
    myRed = 255;
    myGreen = 25;
    myBlue = 25;
    myAlpha = 255;
  }

  void move()
  {
  }

  // display our Flag
  void display()
  {
    // use our reference to the canvas to draw our Flag

    this.canvas.strokeWeight(3);
    this.canvas.stroke(1);
    //stroke(2);
    color(0);
    this.canvas.line(x, y, x, y-30);

    this.canvas.stroke(20);
    this.canvas.stroke(myRed, myGreen, myBlue);
    this.canvas.fill(myRed, myGreen, myBlue, myAlpha);
    this.canvas.triangle(x, y-20, x, y-30, x+10, y-25);
  }

  void fade() {
  }

  void drawLine(int id) {
    //  setup line size, width  //
    this.canvas.strokeWeight(3);
    this.canvas.stroke(20);
    this.canvas.stroke(myRed, myGreen, myBlue);

    //  draw line  //
    if (id == 0) {
      //  draw line from this flag to ship  //
      line(x, y, shipPos.x, shipPos.y);
    } else {
      //  draw line from this flag to the last flag  //
      line(x, y, theFlags.get(id-1).x, theFlags.get(id-1).y);
    }
  }
}

class Ball
{
  // instance vars
  private float x;
  private float y;
  private float size;
  private float myRed;
  private float myGreen;
  private float myBlue;
  private float myAlpha;
  private float speedX;
  private float speedY;

  // store a reference to the canvas
  private PApplet canvas;

  Ball(PApplet canvas, float x, float y)
  {
    // store a ref to the canvas
    this.canvas = canvas;

    // store x and y
    this.x = x;
    this.y = y;

    // randomize our size
    size = this.canvas.random(5, 12);

    // randomize our color
    myRed = this.canvas.random(0, 25);
    myGreen = this.canvas.random(0, 25);
    myBlue = this.canvas.random(0, 100);
    myAlpha = this.canvas.random(0, 255);

    // randomize our speed
    speedX = this.canvas.random(0, 3);
    speedY = this.canvas.random(0, 3);
    
    speedX *= -dir.x;
    speedY *= -dir.y;
    
    speedX += random(0, 1);
    speedY += random(0, 1);
    
    if (theFlags.size() == 0){
      speedX /= 2;
      speedY /= 2;
    }
  }

  // move our ball
  void move()
  {
    // update position based on speed
    x += speedX;
    y += speedY;

    // bounce
    if (x > width)
    {
      x = width;
      speedX *= -1;
    }
    if (y > height)
    {
      y = height;
      speedY *= -1;
    }
    if (x < 0)
    {
      x = 0;
      speedX *= -1;
    }
    if (y < 0)
    {
      y = 0;
      speedY *= -1;
    }
  }

  // display our ball
  void display()
  {
    // use our reference to the canvas to draw our ball
    this.canvas.noStroke();
    this.canvas.fill(myRed, myGreen, myBlue, myAlpha);
    this.canvas.ellipse(x, y, size, size);
  }

  // fade method - allows a ball to fade out of existence
  void fade()
  {
    if (myAlpha > 0)
    {
      myAlpha -= 3;
    } else
    {
      myAlpha = 0;
    }
  }
}

class Mine
{
  // instance vars
  private float x;
  private float y;
  private float size;
  private float myRed;
  private float myGreen;
  private float myBlue;
  private float myAlpha;
  private float speedX;
  private float speedY;

  // store a reference to the canvas
  private PApplet canvas;

  Mine(PApplet canvas, float x, float y)
  {
    // store a ref to the canvas
    this.canvas = canvas;

    // store x and y
    this.x = x;
    this.y = y;

    // randomize our size
    size = 30;

    // randomize our color
    myRed = 160;
    myGreen = 0;
    myBlue = 0;
    myAlpha = 255;

    // randomize our speed
    speedX = this.canvas.random(1, 3);
    speedY = this.canvas.random(1, 3);
  }

  // move our ball
  void move()
  {
    // update position based on speed
    x += speedX;
    y += speedY;

    // bounce
    if (x > width)
    {
      x = width;
      speedX *= -1;
    }
    if (y > height)
    {
      y = height;
      speedY *= -1;
    }
    if (x < 0)
    {
      x = 0;
      speedX *= -1;
    }
    if (y < 0)
    {
      y = 0;
      speedY *= -1;
    }
  }

  // display our ball
  void display()
  {
    // use our reference to the canvas to draw our ball
    this.canvas.noStroke();
    this.canvas.fill(myRed, myGreen, myBlue, myAlpha);
    this.canvas.ellipse(x, y, size, size);
  }
  
  void checkCollision(){
    if (dist(shipPos.x, shipPos.y, x, y) < 20){
      gameOver();
    }
  }
}

class TempScoreText
{
  private float myScore = 0;
  private boolean fadeScoreBool;
  float yFadeLocation;
  
  TempScoreText(PApplet canvas)
  {

  }

  // move our ball
  void move()
  {

  }

  // display our ball
  void display()
  {
    fill(255, 255, 255, 255);
    textSize(40);
    
    String scoreString = str(round(myScore));
    text("+"+scoreString, width - 20, 90 - yFadeLocation);
  }
  
  void fadeScore(){

    if (!fadeScoreBool) return;

    yFadeLocation += 1;
    
    if (yFadeLocation >= 40){
      fadeScoreBool = false;
      showTempScore = false;
      yFadeLocation = 0;
      
      safeScore += round(myScore);      
      tempScoreTexts.remove(0);
    }
  }
}