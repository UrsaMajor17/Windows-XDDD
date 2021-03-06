//==========Stages of Game=======
float state = 0;
  //OPENING(Name input)
  //0
  //1
  //2
  //1-->overview screen
  //2-->

/*
Not sure where you want the ones I added to be located on the screen
*/
//===========TRACKER NODES===========
//generally measures of how the country is doing
Node _polcap = new Node(50, "Political Capital"); //the currency we use to enact action
Node _income = new Node(50, "Total Income");
Node _expenditure = new Node (50, "Total Expenditure");
Node _totalhappiness = new Node(50, "Overall Happiness");
Node _poverty = new Node(50, "Poverty");
Node _health = new Node(50, "Health");
Node _crime = new Node(50, "Crime");
Node _oildemand = new Node(50, "Oil Demand");
Node _oilprice = new Node(50, "Oil Price");
Node _oilsupply = new Node(50, "Oil Supply");
Node _unemployment = new Node(50, "Unemployment");
Node _globaleconomy = new Node(50, "Global Economy");
Node _education = new Node(50, "Education");
Node _environment = new Node(50, "The Environment");
Node _vehicleusage = new Node(50, "Vehicle Usage");
Node _gdp = new Node(50, "GDP");
Node _technology = new Node(50, "Technology");

/*
//==========POLICY NODES=========
Node _incometax = new Node(???, 300, 50, "Income Tax");
Node _salestax = new Node(???, 300, 50, "Sales Tax");
Node _roadbuilding = new Node(???, 300, 50, "Road Building");
Node _publictransport = new Node(???, 300, 50, "Subsidized Public Transport");
Node _policeforce = new Node(???, 300, 50, "Police Force");
Node _publicschools = new Node(???, 300, 50, "Public Schools");
Node _cleanenergysubsidies = new Node(???, 300, 50, "Clean Energy Subsidies");
Node _statepensions = new Node(???, 300, 50, "State Pensions");
Node _statehousing = new Node(???, 300, 50, "State Housing");
Node _statehealthcare = new Node(???, 300, 50, "State Healthcare");
Node _militaryspending = new Node(???, 300, 50, "Military Spending");
*/

//==========Dimensions============
final int width = 1025;
final int height = 518;

//==========Instance Vars=======
String name = "DEFAULT";
String country ="DEFAULT";

String myText = "President ";

void setup() {
  size(1025, 518);
}

void draw() {
  
  if (state < 1) {//opening
  
    background(loadImage("Map.png"));
    
    //Outer box
    fill(128, 128,128, 225);
    stroke(128, 128, 128, 225);
    rect(width/4, height/4, width/2, height/2);
    
    //Text
    fill(0, 0, 255);
    stroke(0, 0, 255);
    textAlign(CENTER);
    textSize(30);
    text("DEMOKRATIA", width/2, height/3);
    textSize(20);
    text("BY THE PEOPLE, FOR THE PEOPLE", width/2, height/3 + 30);
    textSize(20);
    text("What is your name?", width/3 + 15, height/2);
    textAlign(LEFT);
    //Input box
    fill(255, 255, 255);
    stroke(255, 255, 255);
    rect(width/3 + 120, height/2 - 20, 250,25);
    fill(0);
    stroke(0);
    text(myText, width/3 + 120, height/2);
    
    //Enter Button
    fill(0, 0, 255, 175);
    stroke(0, 0, 255, 175);
    rect(width/3 + 120, height/2 +40, 100, 50);
    fill(255,255,255);
    stroke(255,255,255);
    textAlign(CENTER);
    text("ENTER", width/3 + 130, height/2 + 50, 75, 50);
    
    //Cursor change over Enter Button
    if (mouseX >= width/3 +120 && mouseX <= width/3 +205 && mouseY >= height/2 + 50 && mouseY <= height/2 + 100) {
      cursor(HAND);
    }
    else {
      cursor(ARROW);
    }
  }
  else {
  background(0);
  }
}

//User input fxn(Clicking) --> differs per stage of game
void mouseClicked() {
  if (state ==0) {
    if (mouseX >= width/3 + 120 && mouseX <= width/3 + 205 && mouseY >= height/2 +50 && mouseY <= height/2 +100) {
      name = myText;
      myText = "";
      state = 1;
    }
  }
}

//User input fxn(Typing) --> differs per stage of game
void keyPressed() {
  
  //STAGE ONE (Name input)
  if (state == 0) {
     if (keyCode == ENTER) {//If enter is pressed, submit name and move on
       name = myText;
       myText = "";
       state = 1;
     }
    else if (keyCode == BACKSPACE) {//Delete existing text, cannot splice empty string
       if (myText.length() > 0) {
             myText = myText.substring(0, myText.length()-1);
        }
    }
    else if (myText.length() < 24 && keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT) {
        myText += key;
     }
  }
 }