int lectura;
int pinPot0 = A0;
int pinPot1 = A1;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
}

void loop() {
  // leer pinPot0 y lo transformo a rango0-127:
  lectura = analogRead(pinPot0)/8;
  //escribo ese valor
  Serial.write(lectura);
  //escribo etiqueta
  Serial.write(130);

  lectura = analogRead(pinPot1)/8;
  //escribo ese valor
  Serial.write(lectura);
  //escribo etiqueta
  Serial.write(131);
}
