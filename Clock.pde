
int secondsPerLine = 30;
int minutesPerLine = 20;
int hoursPerLine = 12;

int spacing = 10;

int secondSize = width / (secondsPerLine + spacing);
int minuteSize = width / (minutesPerLine + spacing);
int hourSize = width / (hoursPerLine + spacing);

color secondColor;
color minuteColor;
color hourColor;

int secondsY;
int minutesY;
int hoursY;

void setup() {
  size(800, 600);

  secondSize = 20;
  minuteSize = 40;
  hourSize = 60;

  secondColor = color(33, 158, 188);
  minuteColor = color(251, 133, 0);
  hourColor = color(103, 148, 54);

  hoursY = 0;
  minutesY = 2 * (hourSize + spacing);
  secondsY = minutesY + (3 * (minuteSize + spacing));
}

void draw() {
  background(255);
  int seconds = second();
  int minutes = minute();
  int hours = hour();


  //create hours on a first and second line
  if (hours > hoursPerLine) {
    fillHours(hoursPerLine, hoursY);
    fillHours(hours - hoursPerLine, hoursY + hourSize + spacing);
  } else {
    // create hours on a first line
    fillHours(hours, hoursY);
  }

  //create minutes on a first, second, and third line
  if (minutes > 2 * minutesPerLine) {
    fillMinutes(minutesPerLine, minutesY);
    fillMinutes(minutesPerLine, minutesY + minuteSize + spacing);
    fillMinutes(minutes, minutesY + (2 * (minuteSize + spacing)));
    // create minutes on a first and second line
  } else if (minutes > minutesPerLine) {
    fillMinutes(minutesPerLine, minutesY);
    fillMinutes(minutes - minutesPerLine, minutesY + minuteSize + spacing);
  } else {
    // create minutes on a first line
    fillMinutes(minutes, minutesY);
  }

  //create seconds on a first and second line
  if (seconds > secondsPerLine) {
    fillSeconds(secondsPerLine, secondsY);
    fillSeconds(seconds - secondsPerLine, secondsY + secondSize + spacing);
  } else {
    // create seconds on a first line
    fillSeconds(seconds, secondsY);
  }
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
