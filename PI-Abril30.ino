int pinLed1 = 3;
int pinLed2 = 5;
int val = 0;
bool write1;
bool write2;

void setup() {
  Serial.begin(9600);
  pinMode(pinLed1,OUTPUT);
  pinMode(pinLed2,OUTPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
   if(Serial.available()==true){
     val = Serial.read();
     if(val>=128){
       if(val == 128){
         write1 = true;
       }
       else{
         write1 =false;
       }
       if(val == 129){
         write2= true;
       }
       else{
         write2=false;
       }
     }
     else{
       if(write1){
         analogWrite(pinLed1,val);
       }
       if(write2){
         analogWrite(pinLed2,val);
       }
     }
   }
}
