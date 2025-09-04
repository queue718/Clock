// global variables
float secondSize;
float minuteSize;
float hourSize;

int secondsPerLine = 30;
int minutesPerLine = 20;
int hoursPerLine = 12;

int spacing = 10;

color secondColor;
color minuteColor;
color hourColor;

float secondsY;
float minutesY;
float hoursY;

int numHourLines;
int numMinuteLines;
int numSecondLines;

void setup() {
  size(610, 250);
  
  secondsPerLine = 30;
  minutesPerLine = 20;
  hoursPerLine = 12;

  secondSize = (float(width) - ((secondsPerLine) * spacing)) / secondsPerLine;
  minuteSize = (float(width) - ((minutesPerLine) * spacing)) / minutesPerLine;
  hourSize = (float(width) - ((hoursPerLine) * spacing)) / hoursPerLine;

  secondColor = color(33, 158, 188);
  minuteColor = color(251, 133, 0);
  hourColor = color(103, 148, 54);

  hoursY = spacing;
  minutesY = (2 * hourSize) + (3 * spacing);
  secondsY = minutesY + (3 * (minuteSize + spacing));
}

void draw() {
  background(255);
  int seconds = second();
  int minutes = minute();
  int hours = hour();
  
  numHourLines = ceil(float(hours) / hoursPerLine);
  numMinuteLines = ceil(float(minutes) / minutesPerLine);
  numSecondLines = ceil(float(seconds) / secondsPerLine);

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
  if (numMinuteLines == 3) {
    fillMinutes(minutesPerLine, minutesY);
    fillMinutes(minutesPerLine, minutesY + minuteSize + spacing);
    fillMinutes(minutes - (2 * minutesPerLine), minutesY + (2 * (minuteSize + spacing)));
    // create minutes on a first and second line
  } 
  if (numMinuteLines == 2) {
    fillMinutes(minutesPerLine, minutesY);
    fillMinutes(minutes - minutesPerLine, minutesY + minuteSize + spacing);
  }
  if (numMinuteLines == 1) {
    // create minutes on a first line
    fillMinutes(minutes, minutesY);
  }

  //create seconds on a first and second line
  if (numSecondLines == 2) {
    fillSeconds(secondsPerLine, secondsY);
    fillSeconds(seconds - secondsPerLine, secondsY + secondSize + spacing);
  }
  if (numSecondLines == 1) {
    // create seconds on a first line
    fillSeconds(seconds, secondsY);
  }
}

void fillSeconds(int num, float y) {
  for (int x = 0; x < num * (secondSize + spacing); x += secondSize + spacing) {
    noStroke();
    fill(secondColor);
    rect(x + spacing, y, secondSize, secondSize);
  }
}

void fillMinutes(int num, float y) {
  for (int x = 0; x < num * (minuteSize + spacing); x += minuteSize + spacing) {
    noStroke();
    fill(minuteColor);
    rect(x + spacing, y, minuteSize, minuteSize);
  }
}

void fillHours(int num, float y) {
  for (int x = 0; x < num * (hourSize + spacing); x += hourSize + spacing) {
    noStroke();
    fill(hourColor);
    rect(x + spacing, y, hourSize, hourSize);
  }
}
