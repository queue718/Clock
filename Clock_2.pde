hoursPerLine;
minsPerLine;
secsPerLine;

hourSize;
minSize;
secSize;

spacing;

hoursY;
minutesY;
secondsY;

void setup() {
  size(1490, 1490);

  hoursPerLine = 15;
  minsPerLine = 20;
  secsPerLine = 30;
  
  hourSize = 30;
  minSize = 20;
  secSize = 15;
  
  spacing = 10;
    
  hoursY = 0;
  minutesY = 2 * (hourSize + spacing);
  secondsY = minutesY + (3 * (minuteSize + spacing));
}


void fillSeconds(int num, int y) {
  for (int x = 0; x < num * (secondSize + spacing); x += secondSize + spacing) {
    noStroke();
    fill(secondColor);
    rect(x + spacing, y, secondSize, secondSize);
  }
}

void fillMinutes(int num, int y) {
  for (int x = 0; x < num * (minuteSize + spacing); x += minuteSize + spacing) {
    noStroke();
    fill(minuteColor);
    rect(x + spacing, y, minuteSize, minuteSize);
  }
}

void fillHours(int num, int y) {
  for (int x = 0; x < num * (hourSize + spacing); x += hourSize + spacing) {
    noStroke();
    fill(hourColor);
    rect(x + spacing, y, hourSize, hourSize);
  }
}


void draw() {
  background(255);
  fillHours(hoursPerLine, hoursY);
  fillMinutes(minsPerLine, minutesY);
  fillSeconds(secsPerLine, secondsY);
}
