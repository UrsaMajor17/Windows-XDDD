//==========Stages of Game=======
float state = 0;
  //opening
  //0
  //1
  //2
  //end of opening
  //1-->overview screen
  //2-->

//===========NODES===========
Node _welfare = new Node(300, 300, 50, "Welfare");
Node _poverty = new Node (500, 300, 50, "Poverty");

final int width = 1025;
final int height = 518;

String myText = "President ";

void setup() {
  size(1025, 518);
  _welfare.addN(_poverty);
  _poverty.addN(_welfare);
}

void draw() {
  
  if (state < 1) {//opening
  
    background(loadImage("Map.png"));
    
    fill(128, 128,128, 225);
    stroke(128, 128, 128, 225);
    rect(width/4, height/4, width/2, height/2);
    
    fill(0, 0, 255);
    stroke(0, 0, 255);
    textAlign(CENTER);
    textSize(30);
    text("DEMOKRATIA", width/2, height/3);
    
    textSize(20);
    text("BY THE PEOPLE, FOR THE PEOPLE", width/2, height/3 + 30);
    
    fill(255,0,0);
    stroke(255,0,0);
    textSize(20);
    text("What is your name?", width/3 + 15, height/2);
    textAlign(LEFT);
    
    fill(255, 255, 255);
    stroke(255, 255, 255);
    rect(width/3 + 120, height/2 - 20, 250,25);
    fill(0);
    stroke(0);
    text(myText, width/3 + 120, height/2);
    
    fill(255,0,0);
    stroke(255,0,0);
    text("What is your country?", width/3 + 15, height/2 + 150);
    textAlign(LEFT);
  }
  else {
  background(0);
  _welfare.draw();
  _poverty.draw();
  
  mousePressed();
  }
}

void mouseClicked() {
  if (mouseX <= _welfare.x + _welfare.rad && mouseX >= _welfare.x - _welfare.rad
      && mouseY <= _welfare.y + _welfare.rad && mouseY >= _welfare.y - _welfare.rad) {
    _welfare.grow(2);
    _welfare.affect(true, 2);
  }
  if (mouseX <= _poverty.x + _poverty.rad && mouseX >= _poverty.x - _poverty.rad 
    && mouseY <= _poverty.y + _poverty.rad && mouseY >= _poverty.y - _poverty.rad) {
    _poverty.grow(2);
    _poverty.affect(true, 2);
  }
}

void keyPressed() {
  if (state == 0) {
     if (keyCode == ENTER) {
       //save name
       state = 0.5;
     }
    if (keyCode == BACKSPACE) {
       if (myText.length() > 0) {
             myText = myText.substring(0, myText.length()-1);
        }
    }
    else if (myText.length() < 25 && keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT) {
        myText += key;
     }
  }
  else if (state == 0.5) {
    if (keyCode == BACKSPACE) {
       if (myText.length() > 0) {
             myText = myText.substring(0, myText.length()-1);
        }
    }
    else if (myText.length() < 25 && keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT) {
        myText += key;
     }
  }
 }