import javax.swing.*; 

boolean isButton00Active = false;  
boolean isButton01Active = false;  
boolean isButton02Active = false;  

boolean isButton10Active = false;  
boolean isButton12Active = false;  

boolean isButton20Active = false;  
boolean isButton21Active = false; 
boolean isButton22Active = false;  

boolean isTwoButtonsDone = false;
boolean isFourButtonsDone = false;
boolean isEightButtonsDone = false;

String userNumber = "aa";
int trialCount = 0;

long startTime = 0;
long endTime = 0;
float timeDiff = 0;
String timeDiffString;
int errorCount = 0;
int blockNo = 1;

PrintWriter output;

void setup() {
  size(600, 600);
  background(0);
  
  userNumber = JOptionPane.showInputDialog(frame, "Enter user number");
  
  if(userNumber == null) {
    exit();
  }
  
  output = createWriter(userNumber+"_log.txt"); 
  
}

void draw() {
  background(255);
  stroke(0);

  
  if(isEightButtonsDone) {
    JOptionPane.showMessageDialog(frame,"Thank you for testing the program!");  
    output.flush();
    output.close();
    exit();
    return;
  }
  
  if(trialCount < TRIAL_COUNT && isTwoButtonsDone) {
    button(isButton01Active, BUTTON_01_POS[0], BUTTON_01_POS[1], BUTTON_WIDTH, BUTTON_HEIGHT);
    button(isButton21Active, BUTTON_21_POS[0], BUTTON_21_POS[1], BUTTON_WIDTH, BUTTON_HEIGHT);
  }
  
  if(trialCount < TRIAL_COUNT && isFourButtonsDone) {
      //First row buttons
    button(isButton00Active, BUTTON_00_POS[0], BUTTON_00_POS[1], BUTTON_WIDTH, BUTTON_HEIGHT);
    button(isButton02Active, BUTTON_02_POS[0], BUTTON_02_POS[1], BUTTON_WIDTH, BUTTON_HEIGHT);
    //Last row buttons
    button(isButton20Active, BUTTON_20_POS[0], BUTTON_20_POS[1], BUTTON_WIDTH, BUTTON_HEIGHT);
    button(isButton22Active, BUTTON_22_POS[0], BUTTON_22_POS[1], BUTTON_WIDTH, BUTTON_HEIGHT);
  }
  
  if(trialCount < TRIAL_COUNT) {
 
    //Middle row buttons
    button(isButton10Active, BUTTON_10_POS[0], BUTTON_10_POS[1], BUTTON_WIDTH, BUTTON_HEIGHT);
    button(isButton12Active, BUTTON_12_POS[0], BUTTON_12_POS[1], BUTTON_WIDTH, BUTTON_HEIGHT);
  }
  
  startButton();
 
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
    fill(color(#F5EC43));
  } else {
    fill(#F2EF98);
  }
  
  ellipse(WIDTH/2, HEIGHT/2, 100, 100);
  
  fill(0);
  textAlign(CENTER);
  
  
  if(trialCount >= TRIAL_COUNT) {
    text("Click to \ncontinue", WIDTH/2, HEIGHT/2);
  } else {
    text("Start", WIDTH/2, HEIGHT/2);
  }
  
  
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
    
    startTime = System.currentTimeMillis();
  
    resetButtons();
    activateRandomButton();
    if(trialCount >= TRIAL_COUNT) {
      
      trialCount = 0;
      
      if(!isTwoButtonsDone) {
        isTwoButtonsDone = true;
        blockNo++;
        return;
      }
      if(isTwoButtonsDone && !isFourButtonsDone) {
        isFourButtonsDone = true;
        blockNo++;
        return;
      }
      
      if(isFourButtonsDone) {
        isEightButtonsDone = true; 
      }
      
    }
    return;
    
  } else if(isButton00Active && overButton(BUTTON_00_POS[0], BUTTON_00_POS[1], BUTTON_WIDTH, BUTTON_HEIGHT)) {
    isButton00Active = false;
    trialCount++;
    endTime = System.currentTimeMillis();
    timeDiff = (endTime-startTime)/1000.0;
  
  } else if(isButton01Active && overButton(BUTTON_01_POS[0], BUTTON_01_POS[1], BUTTON_WIDTH, BUTTON_HEIGHT)) {
    isButton01Active = false;
    trialCount++;
    endTime = System.currentTimeMillis();
    timeDiff = (endTime-startTime)/1000.0;
    
  } else if(isButton02Active && overButton(BUTTON_02_POS[0], BUTTON_02_POS[1], BUTTON_WIDTH, BUTTON_HEIGHT)) {
    isButton02Active = false;
    trialCount++;
    endTime = System.currentTimeMillis();
    timeDiff = (endTime-startTime)/1000.0;
    
  } else if(isButton10Active && overButton(BUTTON_10_POS[0], BUTTON_10_POS[1], BUTTON_WIDTH, BUTTON_HEIGHT)) {
    isButton10Active = false;
    trialCount++;
    endTime = System.currentTimeMillis();
    timeDiff = (endTime-startTime)/1000.0;
    
  } else if(isButton12Active && overButton(BUTTON_12_POS[0], BUTTON_12_POS[1], BUTTON_WIDTH, BUTTON_HEIGHT)) {
    isButton12Active = false;
    trialCount++;
    endTime = System.currentTimeMillis();
    timeDiff = (endTime-startTime)/1000.0;
    
  } else if(isButton20Active && overButton(BUTTON_20_POS[0], BUTTON_20_POS[1], BUTTON_WIDTH, BUTTON_HEIGHT)) {
    isButton20Active = false;
    trialCount++;
    endTime = System.currentTimeMillis();
    timeDiff = (endTime-startTime)/1000.0;
    
  } else if(isButton21Active && overButton(BUTTON_21_POS[0], BUTTON_21_POS[1], BUTTON_WIDTH, BUTTON_HEIGHT)) {
    isButton21Active = false;
    trialCount++;
    endTime = System.currentTimeMillis();
    timeDiff = (endTime-startTime)/1000.0;
    
  } else if(isButton22Active && overButton(BUTTON_22_POS[0], BUTTON_22_POS[1], BUTTON_WIDTH, BUTTON_HEIGHT)) {
    isButton22Active = false;
    trialCount++;
    endTime = System.currentTimeMillis();
    timeDiff = (endTime-startTime)/1000.0;
  } else {
    errorCount++;
  }
  
  println("User:"+userNumber+"   Block no:"+blockNo+"   Trial no:"+trialCount+"   Time elapsed:"+nf(timeDiff, 0, 5)+"sec   Error count:"+errorCount);
  output.println("User:"+userNumber+"   Block no:"+blockNo+"   Trial no:"+trialCount+"   Time elapsed:"+nf(timeDiff, 0, 5)+"sec   Error count:"+errorCount);
}

void activateRandomButton() {
  int buttonToActivate = int(random(2));
  
  if(isTwoButtonsDone) {
    buttonToActivate = int(random(4));
  } else if(isFourButtonsDone) {
    buttonToActivate = int(random(8));
  }
  
    switch(buttonToActivate) {
      case 0:
        isButton10Active = true;
        break;
      
      case 1:
        isButton12Active = true;
        break;
      
      case 2:
        isButton01Active = true;
        break;
      
      case 3:
        isButton21Active = true;
        break;
      
      case 4:
        isButton00Active = true;
        break;
      
      case 5:
        isButton02Active = true;
        break;
      
      case 6:
        isButton20Active = true;
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
