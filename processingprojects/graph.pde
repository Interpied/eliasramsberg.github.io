ArrayList<Float> values = new ArrayList<Float>();
float lineIndex;
float lineIncrement;
float margin;
float boldLineDelay;
int rectSize = 10;
boolean darkMode;

//float redrawPointsDelay;

void setup(){
 size (1280, 720);
 //fullScreen();
 noStroke();
 lineIndex = 0;
 values.add(random(height));
 
 lineIncrement = 10;
 margin = 20;
 boldLineDelay = 5;
 darkMode = true;
 frameRate(10);
 
}

void keyPressed() {
  if (key == 32){
    if (darkMode) darkMode = false;
    else darkMode = true;
  }
}

void draw() {
  if (!darkMode) background(255);
  else background(0);
  /*for (int x = 0; x < width; x += rectSize){
    for (int y = 0; y < height; y += rectSize){
      float fX = x;
      float fY = y;
      fill (255, fX / width * 255, fY / height * 255, 100);
      rect(x, y, rectSize, rectSize);
    }
  }*/
  //strokeWeight(0.5);
  if (!darkMode) stroke(200);
  else stroke(50);
  float delay = boldLineDelay;
  for (int x = 0; x < width; x += lineIncrement){
    if (delay == 0){
      delay = 5;
      strokeWeight(1.5);
    }
    else{
      delay--;
      strokeWeight(0.5);
    }
    
    line(x, 0, x, height);
  }
  float delayY = 5;
  for (int y = 0; y < height; y += lineIncrement){
    if (delayY == 0){
      delayY = 5;
      strokeWeight(1.5);
    }
    else{
      delayY--;
      strokeWeight(0.5);
    }
    line(0, y, width, y);
  }
  
  float deviation = 100;
  float newNum = values.get(values.size()-1) + random(deviation) - deviation * 0.5;
  if (newNum > height - margin) newNum = height - margin - random(deviation / 2);
  else if (newNum < margin) newNum = margin + random(deviation / 2);
  values.add(newNum);
  
  float threshold = width;
  threshold *= 0.8;
  if (lineIncrement * values.size() > threshold){
    values.remove(0);
    if (boldLineDelay == 0) boldLineDelay = 5;
    else boldLineDelay --;
  }
  
  //else lineIndex += lineIncrement;
  int lowestPoint = 0;
  int highestPoint = 0;
  
  
  if (!darkMode) stroke(126);
  else stroke(0, 200, 0);
  strokeWeight(lineIncrement / 5);
  for (int i = 0; i < values.size()-1; i++){
    //float lastPos = height / 2;
    //if (i > 0) lastPos = values.get(i);
    //line(i * lineIncrement, values.get(i)
    if (darkMode) {
      if (values.get(i) < values.get(i+1)) stroke(200,0,0);
      else stroke(0,200,0);
    }
    line(i * lineIncrement, values.get(i), (i + 1) * lineIncrement, values.get(i+1));
    if (values.get(i) > values.get(highestPoint)) highestPoint = i;
    if (values.get(i) < values.get(lowestPoint)) lowestPoint = i;
  }
  stroke(200);
  
  line(lineIncrement * highestPoint - 5, values.get(highestPoint), lineIncrement * highestPoint + 5, values.get(highestPoint));
  textSize(20);
  fill(0, 255,0);
  text("BUY AT $" + (height - round(values.get(highestPoint))), lineIncrement * highestPoint + 10, values.get(highestPoint) + 5); 
  
  line(lineIncrement * lowestPoint - 5, values.get(lowestPoint), lineIncrement * lowestPoint + 5, values.get(lowestPoint));
  fill(255, 0, 0);
  text("SELL AT $" + (height - round(values.get(lowestPoint))), lineIncrement * lowestPoint + 10, values.get(lowestPoint) + 5);
  
  fill(0, 255, 0);
  textSize(25);

  Float result = height - values.get(values.size()-1)
  result = (nf(result, 0, 2));
  text("$"+ result, lineIncrement * values.size(), values.get(values.size()-1));
}