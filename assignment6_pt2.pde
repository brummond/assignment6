import processing.serial.*;

Serial myPort;          // The serial port
float xValue = 250;
float yValue = 250;
int buttonState;
int col = 0;

void setup () {
  // set the window size:
  size(500, 500);

  // I know that the first port in the serial list on my Mac is always my
  // Arduino, so I open Serial.list()[0].
  // Open whatever port is the one you're using.
  myPort = new Serial(this, Serial.list()[3], 9600);

  // don't generate a serialEvent() unless you get a newline character:
  myPort.bufferUntil('\n');

  // set initial background:
  background(col, col, col);
}

void draw () {
  if (buttonState == 1) {
    col = col + 10;
  }
  background(col, col, col);
  square(xValue, yValue, 20);
}

void serialEvent (Serial myPort) {
  // get the ASCII string:
  String inString = myPort.readStringUntil('\n');

  if (inString != null) {
    String[] split = inString.split(",");
    xValue = int(split[0]);
    yValue = int(split[1]);
    buttonState = int(split[2]);

    xValue = map(xValue, 0, 1023, 0, 500);
    yValue = map(yValue, 0, 1023, 0, 500);
  }
}
