// global variables
float secSize;
float minSize;
float hourSize;

int secsPerLine = 30;
int minsPerLine = 20;
int hoursPerLine = 12;

int spacing = 10;

color secColor;
color minColor;
color hourColor;

float secsY;
float minsY;
float hoursY;

int numHourLines;
int numMinLines;
int numSecLines;

void setup() {
  size(610, 250);
  
  secsPerLine = 30;
  minsPerLine = 20;
  hoursPerLine = 12;

  secSize = (float(width) - ((secsPerLine) * spacing)) / secsPerLine;
  minSize = (float(width) - ((minsPerLine) * spacing)) / minsPerLine;
  hourSize = (float(width) - ((hoursPerLine) * spacing)) / hoursPerLine;

  secColor = color(33, 158, 188);
  minColor = color(251, 133, 0);
  hourColor = color(103, 148, 54);
}

void draw() {
  background(255);
  int seconds = second();
  int minutes = minute();
  int hours = hour();
  
  numHourLines = ceil(float(hours) / hoursPerLine);
  numMinLines = ceil(float(minutes) / minsPerLine);
  numSecLines = ceil(float(seconds) / secsPerLine);
  
  hoursY = spacing;
  minsY = (numHourLines * hourSize) + ((numHourLines + 1) * spacing);
  secsY = minsY + (numMinLines * (minSize + spacing));

  //create hours on a first and second line
  if (numHourLines == 2) {
    fillHours(hoursPerLine, hoursY);
    fillHours(hours - hoursPerLine, hoursY + hourSize + spacing);
  }
  if (numHourLines == 1) {
    // create hours on a first line
    fillHours(hours, hoursY);
  }

  //create minutes on a first, second, and third line
  if (numMinLines == 3) {
    fillMinutes(minsPerLine, minsY);
    fillMinutes(minsPerLine, minsY + minSize + spacing);
    fillMinutes(minutes - (2 * minsPerLine), minsY + (2 * (minSize + spacing)));
    // create minutes on a first and second line
  } 
  if (numMinLines == 2) {
    fillMinutes(minsPerLine, minsY);
    fillMinutes(minutes - minsPerLine, minsY + minSize + spacing);
  }
  if (numMinLines == 1) {
    // create minutes on a first line
    fillMinutes(minutes, minsY);
  }

  //create seconds on a first and second line
  if (numSecLines == 2) {
    fillSeconds(secsPerLine, secsY);
    fillSeconds(seconds - secsPerLine, secsY + secSize + spacing);
  }
  if (numSecLines == 1) {
    // create seconds on a first line
    fillSeconds(seconds, secsY);
  }
}

void fillSeconds(int num, float y) {
  for (int x = 0; x < num * (secSize + spacing); x += secSize + spacing) {
    noStroke();
    fill(secColor);
    rect(x + spacing, y, secSize, secSize);
  }
}

void fillMinutes(int num, float y) {
  for (int x = 0; x < num * (minSize + spacing); x += minSize + spacing) {
    noStroke();
    fill(minColor);
    rect(x + spacing, y, minSize, minSize);
  }
}

void fillHours(int num, float y) {
  for (int x = 0; x < num * (hourSize + spacing); x += hourSize + spacing) {
    noStroke();
    fill(hourColor);
    rect(x + spacing, y, hourSize, hourSize);
  }
}
