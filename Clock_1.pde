int secondSize;
int minuteSize;
int hourSize;
int spacing;

color secondColor;
color minuteColor;
color hourColor;

int secondsY;
int minutesY;
int hoursY;

void setup() {
  size(1090, 600);

  secondSize = 20;
  minuteSize = 40;
  hourSize = 60;
  spacing = 10;

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

  int secondsLineFull = width / (secondSize + spacing);
  int minutesLineFull = width / (minuteSize + spacing);
  int hoursLineFull = width / (hourSize + spacing);

  //create hours on a first and second line
  if (hours > hoursLineFull) {
    fillHours(hoursLineFull, hoursY);
    fillHours(hours - hoursLineFull, hoursY + hourSize + spacing);
  } else {
    // create hours on a first line
    fillHours(hours, hoursY);
  }

  //create minutes on a first, second, and third line
  if (minutes > 2 * minutesLineFull) {
    fillMinutes(minutesLineFull, minutesY);
    fillMinutes(minutesLineFull, minutesY + minuteSize + spacing);
    fillMinutes(minutes, minutesY + (2 * (minuteSize + spacing)));
  } else
    // create minutes on a first and second line
    if (minutes > minutesLineFull) {
      fillMinutes(minutesLineFull, minutesY);
      fillMinutes(minutes - minutesLineFull, minutesY + minuteSize + spacing);
    } else {
      // create minutes on a first line
      fillMinutes(minutes, minutesY);
    }

  //create seconds on a first and second line
  if (seconds > secondsLineFull) {
    fillSeconds(secondsLineFull, secondsY);
    fillSeconds(seconds - secondsLineFull, secondsY + secondSize + spacing);
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
