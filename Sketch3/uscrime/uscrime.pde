//Homework 06 - Data Vis
//cases of robbery in the US from 1997 to 2016


String filename = "crime-us-fbi.csv";
String[] rawData;
int[] years = new int[20];
int[] scores = new int[20];

int margin, graphHeight;
float xSpacer;
PVector[] positions = new PVector[20];
int overallMin, overallMax;


void setup() {
  size(1600, 300);
  processData();
}

void draw() {
  background(20, 80, 50);
  String s = "Cases of Robbery in the U.S.";
  fill(-33);
  text(s, 700, 12, 190, 34);  
  
  drawGUI();
  
  fill(200);
  for(int i=0; i<positions.length; i++) {
    ellipse(positions[i].x, positions[i].y, 15, 15); 
  }
}


void drawGUI() {
  for(int i=0; i<positions.length; i++) {
    stroke(200, 100);
    line(positions[i].x, margin, positions[i].x, height - margin);
    text(years[i], positions[i].x - 15, height - margin + 20); 
   
    if(i > 0) {
      stroke(200);
      line(positions[i].x, positions[i].y, positions[i-1].x, positions[i-1].y); 
    }
  } 
  
  text(overallMax, 5, margin);
  text(overallMin, 5, height - margin);
  
}


void processData() {
  rawData = loadStrings(filename);
  for (int i=1; i<rawData.length; i++) {
    String[] thisRow = split(rawData[i], ";");
    years[i-1] = int(thisRow[0]);
    scores[i-1] = int(thisRow[3]);
  }
  
  overallMin = min(scores);
  overallMax = max(scores);
  
  margin = 50;
  graphHeight = (height-margin) - margin;
  xSpacer = (width - margin - margin) / (years.length - 1);
  
  for(int i=0; i<scores.length; i++) {
     float adjScore = map(scores[i], overallMin, overallMax, 0, graphHeight);
     float yPos = height -margin - adjScore;
     float xPos = margin + (xSpacer * i);
     positions[i] = new PVector(xPos, yPos);
  }
}
