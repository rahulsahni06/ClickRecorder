
boolean isButton00Active = false;  
boolean isButton01Active = false;  
boolean isButton02Active = false;  

boolean isButton10Active = false;  
boolean isButton12Active = false;  

boolean isButton20Active = false;  
boolean isButton21Active = false; 
boolean isButton22Active = false;  

void setup() {
  //fullScreen();
  size(640, 640);
  background(0);
}

void draw() {
  background(0);
  
  //First row buttons
  button(isButton00Active, BUTTON_00_POS[0], BUTTON_00_POS[1], BUTTON_WIDTH, BUTTON_HEIGHT);
  button(isButton01Active, BUTTON_01_POS[0], BUTTON_01_POS[1], BUTTON_WIDTH, BUTTON_HEIGHT);
  button(isButton02Active, BUTTON_02_POS[0], BUTTON_02_POS[1], BUTTON_WIDTH, BUTTON_HEIGHT);
  
  //Middle row buttons
  button(isButton10Active, BUTTON_10_POS[0], BUTTON_10_POS[1], BUTTON_WIDTH, BUTTON_HEIGHT);
  button(isButton12Active, BUTTON_12_POS[0], BUTTON_12_POS[1], BUTTON_WIDTH, BUTTON_HEIGHT);
  startButton();
  
  //Last row buttons
  button(isButton20Active, BUTTON_20_POS[0], BUTTON_20_POS[1], BUTTON_WIDTH, BUTTON_HEIGHT);
  button(isButton21Active, BUTTON_21_POS[0], BUTTON_21_POS[1], BUTTON_WIDTH, BUTTON_HEIGHT);
  button(isButton22Active, BUTTON_22_POS[0], BUTTON_22_POS[1], BUTTON_WIDTH, BUTTON_HEIGHT);
  
  
}

void button(boolean isActive, float x, float y, int rectWidth, int rectHeight) {
  
  if(isActive) {
    fill(color(#E82C2C));
  } else {
    fill(color(#E82C2C), 80);
  }
  rectMode(CENTER);
  rect(x, y, rectWidth, rectHeight);
}

void startButton() {
  
  if(overStartButton(WIDTH/2, HEIGHT/2, 100)) {
    fill(color(204));
  } else {
    fill(#ffffff);
  }
  
  ellipse(WIDTH/2, HEIGHT/2, 100, 100);
  
  fill(0);
  textAlign(CENTER);
  text("START", WIDTH/2, HEIGHT/2);
}


boolean overStartButton(int x, int y, int diameter) {
  float disX= x - mouseX;
  float disY = y - mouseY;
  return sqrt(sq(disX) + sq(disY)) < diameter/2;
}

boolean overButton(float x, float y, int buttonWidth, int buttonHeight) {
  return mouseX > x-buttonWidth/2 && mouseX < x+buttonWidth/2 && mouseY > y-buttonHeight/2 && mouseY < y+buttonHeight/2;
}

void mousePressed() {
  if(overStartButton(WIDTH/2, HEIGHT/2, 100)) {
    println("Start pressed");
  
    resetButtons();
    activateRandomButton();
    
  } else if(isButton00Active && overButton(BUTTON_00_POS[0], BUTTON_00_POS[1], BUTTON_WIDTH, BUTTON_HEIGHT)) {
    isButton00Active = false;
  } else if(isButton01Active && overButton(BUTTON_01_POS[0], BUTTON_01_POS[1], BUTTON_WIDTH, BUTTON_HEIGHT)) {
    isButton01Active = false;
  } else if(isButton02Active && overButton(BUTTON_02_POS[0], BUTTON_02_POS[1], BUTTON_WIDTH, BUTTON_HEIGHT)) {
    isButton02Active = false;
  } else if(isButton10Active && overButton(BUTTON_10_POS[0], BUTTON_10_POS[1], BUTTON_WIDTH, BUTTON_HEIGHT)) {
    isButton10Active = false;
  } else if(isButton12Active && overButton(BUTTON_12_POS[0], BUTTON_12_POS[1], BUTTON_WIDTH, BUTTON_HEIGHT)) {
    isButton12Active = false;
  } else if(isButton20Active && overButton(BUTTON_20_POS[0], BUTTON_20_POS[1], BUTTON_WIDTH, BUTTON_HEIGHT)) {
    isButton20Active = false;
  } else if(isButton21Active && overButton(BUTTON_21_POS[0], BUTTON_21_POS[1], BUTTON_WIDTH, BUTTON_HEIGHT)) {
    isButton21Active = false;
  } else if(isButton22Active && overButton(BUTTON_22_POS[0], BUTTON_22_POS[1], BUTTON_WIDTH, BUTTON_HEIGHT)) {
    isButton22Active = false;
  }
  
}

void activateRandomButton() {
  int buttonToActivate = int(random(8));
    switch(buttonToActivate) {
      case 0:
        isButton00Active = true;
        break;
      case 1:
        isButton01Active = true;
        break;
      case 2:
        isButton02Active = true;
        break;
      case 3:
        isButton10Active = true;
        break;
      case 4:
        isButton12Active = true;
        break;
      case 5:
        isButton20Active = true;
        break;
      case 6:
        isButton21Active = true;
        break;
      case 7:
        isButton22Active = true;
        break;
    }
}

void resetButtons() {
  isButton00Active = false;  
  isButton01Active = false;  
  isButton02Active = false;  

  isButton10Active = false;  
  isButton12Active = false;  

  isButton20Active = false;  
  isButton21Active = false; 
  isButton22Active = false;  
}
