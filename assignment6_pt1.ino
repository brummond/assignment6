char var;

void setup() {
  pinMode(12, OUTPUT);
  Serial.begin(9600);
}

void loop() {
  while (Serial.available()) {
    var = Serial.read();
  }
  if (var == 'H') {
    digitalWrite(12, HIGH);
    tone(9, 60, 100);
  }
  else {
    digitalWrite(12, LOW);
  }
}
