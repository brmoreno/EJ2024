void setup(){
  size(400,400);
  float r[] = new float [5];
  float g[] = new float [5];
  float b[] = new float [5];
  
  for(int i = 0; i<5; i++){
    r[i] = random(255);
    g[i] = random(255);
    b[i] = random(255);
  }
  
  for(int i = 0; i<400; i++){
    int ant = i/100 ;
    int sig = ant +1;
    float vantr = r[ant];
    float vantg =  g[ant];
    float vantb =  b[ant];
    
    float vsigr = r[sig];
    float vsigg =  g[sig];
    float vsigb =  b[sig];
    
    float pint= ((i%100)*1f)/100;
    float rojo = lerp(vantr,vsigr,pint);
    float verde = lerp(vantg,vsigg,pint);
    float azul = lerp(vantb,vsigb,pint);
    noStroke();
    fill(rojo,verde,azul);
    rect(i,0,1,400);
  }
}
