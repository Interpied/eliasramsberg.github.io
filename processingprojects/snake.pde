ArrayList<PVector> circles = new ArrayList<PVector>();
PVector snakePos = new PVector(0, 0);
PVector snakePosChange = new PVector(0, 0);
PVector snakeSizeFactor = new PVector(0, 0);
float snakeDir = 0;
float snakeTurnRadius = 0;
float movementSpeed = 0;
float circleSize = 0;
int snakeLength = 0;
boolean debug;

int baseSizeDelay;
int sizeIncDelay;
boolean timedGrowth;
int snakeDiffRepeater;

ArrayList<PVector> food = new ArrayList<PVector>();
int foodAmount;
float foodSize;
float closestFood = 0;

ArrayList<ArrayList<PVector>> deadCircles = new ArrayList<ArrayList<PVector>>();
int deadCircleIndex = 0;
int tailCutColor = 255;
int cutLocation = 0;

int rectSize;
int colorSystem;

boolean debug2;
int topSize;
float aveSize;
float ii = 1;
boolean shadows;

float minHeight;
float maxHeight;

void setup() {
  //if (circles.get(10000).x < 0) println("hi");
  size(960, 540);
  //fullScreen();
  ellipseMode(RADIUS);
  frameRate(30);
  noStroke();
  
  circles.add(new PVector(width / 2, height / 2));

  snakePos.x = width / 2;
  snakePos.y = height / 2;
  snakeDir = random(360);
  
  /////////////////////////////////////////////////////
  //                SETTINGS                         //
  /////////////////////////////////////////////////////
  
  debug = false;
  debug2 = false;
  shadows = true;
  
  movementSpeed = 5; // space between body segments
  snakeTurnRadius = 30; // turning speed
  snakeLength = 150; // starting speed
  snakeDiffRepeater = 2; // snake movement multiplier
  circleSize = 15; // snake size
  colorSystem = 0; // Colorsystem 0 / 1
  snakeSizeFactor = new PVector(0.3, 1);
  
  timedGrowth = false;
  baseSizeDelay = 50;
  
  foodAmount = 8;
  foodSize = 20;
  minHeight = 150;
  maxHeight = 250;
  
  rectSize = width / 10; // Background square size
  
  while (food.size() < foodAmount) {
    addFood(0,0);
  }
  sizeIncDelay = baseSizeDelay;
  aveSize = snakeLength;
  topSize = snakeLength;
}

void keyPressed() {
  if (key == 32){
    colorSystem ++;
    //if (colorSystem > 3) colorSystem = 0;
  }
}

void mousePressed() {
  //food.add(new PVector(mouseX, mouseY, random(255)));
  addFood(mouseX, mouseY);
}

void draw() {
  background(0);
  noStroke();
  for (int x = 0; x < width; x += rectSize){
    for (int y = 0; y < height; y += rectSize){
      float fX = x;
      float fY = y;
      fill (255, fX / width * 255, fY / height * 255, 50);
      rect(x, y, rectSize, rectSize);
    }
  }
  
  ///////////////////////////////////////////////////////////////////////
  //                   FOOD MANAGEMENT                                 //
  ///////////////////////////////////////////////////////////////////////

  closestFood = 0;
  for (int i = 0; i < food.size(); i++) {
    float distFoodToSnake = 0;
    float spacing = food.get(i).z;

    if (snakePos.x - food.get(i).x < 0) distFoodToSnake += food.get(i).x - snakePos.x;
    else distFoodToSnake += snakePos.x - food.get(i).x;
    if (snakePos.y - (food.get(i).y - spacing / 10) < 0) distFoodToSnake += (food.get(i).y - spacing / 10) - snakePos.y;
    else distFoodToSnake += snakePos.y - (food.get(i).y - spacing / 10);

    if (distFoodToSnake < closestFood || closestFood == 0) closestFood = distFoodToSnake;

    /*int minCap = 155;
    food.get(i).z += -5 + random(10);
    if (food.get(i).z > 255) food.get(i).z = 255;
    else if (food.get(i).z < minCap) food.get(i).z = minCap;*/
    if (spacing % 2 == 0) spacing -= 2;
    else spacing += 2;
    if (spacing > maxHeight) spacing = maxHeight;
    else if (food.get(i).z < minHeight) spacing = minHeight + 1;
    fill(0, 255 - (spacing / 3));
    //println(spacing + "; " + spacing / 100);
    float spacingToShadowSize = 1 - (spacing - minHeight) / 1000;
    ellipse(food.get(i).x, food.get(i).y, foodSize * spacingToShadowSize, foodSize * (spacingToShadowSize / 2));
    //fill(0, 200, 0, food.get(i).z);
    food.get(i).z = spacing;
    
    
    if (distFoodToSnake < 50) {
      food.remove(i);
      snakeLength += 3;
      if (foodAmount > food.size())
      addFood(0,0);
    }
    
  }
  for (int i = 0; i < food.size(); i++) {
    fill(0, 200, 0);
    stroke(0.5);
    ellipse(food.get(i).x, food.get(i).y - food.get(i).z / 10, foodSize, foodSize);
    noStroke();
  }
  
  if (sizeIncDelay > 0 && timedGrowth) sizeIncDelay--;
   else {
   sizeIncDelay = baseSizeDelay;
   snakeLength++;
  }
  
  deathHandler();
  
  
  cutLocation = 0;
  for (int i = 0; i < circles.size(); i++) {
    float distHeadToBody = 0;
    if (snakePos.x - circles.get(i).x < 0) distHeadToBody += circles.get(i).x - snakePos.x;
    else distHeadToBody += snakePos.x - circles.get(i).x;
    if (snakePos.y - circles.get(i).y < 0) distHeadToBody += circles.get(i).y - snakePos.y;
    else distHeadToBody += snakePos.y - circles.get(i).y;
    if (distHeadToBody < circleSize * 1.5 && circles.size() - i > 5) cutLocation = i;
    
    if (snakeLength + i > circles.size()) {
      if (colorSystem == 0) {
      float bcolor = map(circles.get(i).x, 0, width, 0, 255);
      float rcolor = map(circles.get(i).y, 0, height, 0, 255);
      fill(rcolor, circles.size() - i, bcolor);
      }
      else if (colorSystem == 1) {
        float r = float(i) / float(snakeLength);
        fill(r * 500 + 60, 0, 0);
      }
      else if (colorSystem == 2) {
        float mouseToSnake = 0;
        if (mouseX - circles.get(i).x < 0) mouseToSnake = circles.get(i).x - mouseX;
        else mouseToSnake = mouseX - circles.get(i).x;
        if (mouseY - circles.get(i).y < 0) mouseToSnake += circles.get(i).y - mouseY;
        else mouseToSnake += mouseY - circles.get(i).y;
        fill(255 - mouseToSnake / 2, 0, 0);
      }
      else if (colorSystem == 3) {
        float mouseToSnake = 0;
        float headx = circles.get(circles.size() - 1).x;
        float heady = circles.get(circles.size() - 1).y;
        if (headx - circles.get(i).x < 0) mouseToSnake = circles.get(i).x - headx;
        else mouseToSnake = headx - circles.get(i).x;
        if (heady - circles.get(i).y < 0) mouseToSnake += circles.get(i).y - heady;
        else mouseToSnake += heady - circles.get(i).y;
        float rcolor = mouseToSnake / 4;
        if (rcolor > 100) rcolor = 100;
        fill(rcolor, 0, 255 - mouseToSnake / 2);
      }
      else colorSystem = 0;
      float realSize = snakeSizeFactor.y;
      realSize += snakeSizeFactor.x / (float(circles.size()) / (float(i)+1));
      ellipse(circles.get(i).x, circles.get(i).y, circleSize * realSize, circleSize * realSize);
      if (shadows){
        fill(0, 50);
        ellipse(circles.get(i).x, circles.get(i).y + 5, circleSize * realSize * 1.2, circleSize * realSize * 1.2);
      }
    } 
    else circles.remove(i);
  }
  
  snakeDiff();
  
  if (debug) {
    println("Direction (360): " + snakeDir);
    println("X: " + snakePosChange.x + "; Y: " + snakePosChange.y);
    println("Size: " + snakeLength);
    println("Total Food: " + foodAmount + "; Active Food: " + food.size());
    println("Closest Food: " + closestFood);
    println("\n");
  }
  if (debug2) {
     aveSize *= ii;
     ii++;
     aveSize = (aveSize + float(circles.size())) / ii;
     if (circles.size() > topSize) topSize = circles.size();
     println("Top Size: " + topSize + "; Average Size: " + aveSize + "; Sample Size: "+ii);
  }
}

void snakeDiff() {
  for (int i = 0; i < snakeDiffRepeater; i++) {
    //Randomize snake
    // 
    snakeDir += random(snakeTurnRadius) - (snakeTurnRadius / 2);
    
    if (snakeDir >= 360) snakeDir -= 360;
    else if (snakeDir < 0) snakeDir += 360;

    /* RIP old movement system
    if (0 <= snakeDir && snakeDir <= 90) {
      snakePosChange.x = snakeDir / 90;
    } 
    else if (90 < snakeDir && snakeDir <= 270) {
      //snakeDir = 180 -> 2 - (180 / 90) = 2 - 2 = 0
      snakePosChange.x = 2 - (snakeDir / 90);
    } 
    else {
      snakePosChange.x = -1 + (snakeDir - 270) / 90;
    }
    
    float localSnakePosChange = 0;
    if (snakePosChange.x < 0) localSnakePosChange = -2 * snakePosChange.x;
    else localSnakePosChange = snakePosChange.x;
    snakePosChange.y = 1 - localSnakePosChange;*/
    
    float radx = snakeDir * 3.1415/180;
    
    snakePosChange.x = cos(radx);
    snakePosChange.y = sin(radx);

    snakePos.x += snakePosChange.x * movementSpeed;
    snakePos.y += snakePosChange.y * movementSpeed;

    //snakePos.x *= movementSpeed;
    //snakePos.y *= movementSpeed;

    if (snakePos.x > width + circleSize) snakePos.x -= width + circleSize * 2;
    else if (snakePos.x < 0 - circleSize) snakePos.x += width + circleSize * 2;
    if (snakePos.y > height + circleSize) snakePos.y -= height + circleSize * 2;
    else if (snakePos.y < 0 - circleSize) snakePos.y += height + circleSize * 2;

    circles.add(new PVector(snakePos.x, snakePos.y));
  }
}

void addFood(float posx, float posy) {
  if (posx == 0) food.add(new PVector(random(width), random(height), random(minHeight, maxHeight)));
  else food.add(new PVector(posx, posy, random(minHeight, maxHeight)));
}

int deadCircleHandler(int dval) {
  if (deadCircles.size() <= dval) return dval;
  if(deadCircles.get(dval).size() == 0) {
    dval = 0;
  }
  else dval = deadCircles.get(dval).size();
  return dval;
}

void deathHandler(){
  ArrayList<PVector> cutOff = new ArrayList<PVector>();
  
  boolean c1 = false;
  if (cutLocation > 0) {
    c1 = true;
    for (int i = 0; i < cutLocation; i++) {
      cutOff.add(new PVector(circles.get(0).x, circles.get(0).y, tailCutColor));
      snakeLength--;
      circles.remove(0);
    }
  }
  //println("Dead Circles Length: " + deadCircles.size());
  if (c1) deadCircles.add(cutOff);
  boolean c2 = false;
  for (int i = 0; i < deadCircles.size(); i++) {
    if (c2) {
      c2 = false;
      i--;
    }
                  //deadCircleHandler: deadCircles.get(i).size() 
    int i2 = 0; 
    while (i2 < deadCircleHandler(i)) {
      //// IF IT HAS NO OPACITY DELETE IT ////
      if (deadCircles.get(i).get(i2).z == 0) {
        deadCircles.remove(i);
        c2 = true;
        //if(i>0)i--;
      }
      //// ELSE DRAW IT AND DARKEN IT ////
      else {
        fill(255, deadCircles.get(i).get(i2).z);
        ellipse(deadCircles.get(i).get(i2).x, deadCircles.get(i).get(i2).y, circleSize, circleSize);
        deadCircles.get(i).get(i2).z -= 5;
      }
      
      i2++;
      //println("wrong7; i2: " + i2 + "; deadCircles.get(i).size() = " + deadCircleHandler(i));
    }
    
    //println("i: " + i + "; i2: " + i2 + "; deadCircles.size(): " + deadCircles.size() + "; deadCircles.get(i).size()" + deadCircles.get(i).size());
    //if (tested) deadCircles.get(i).get(i2 - 1).z--;
  }
}