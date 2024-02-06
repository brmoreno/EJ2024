float x [] = new float[100];
float dx [] = new float[100];
float y [] = new float[100];
float dy [] = new float[100];
float t [] = new float[100];
color relleno [] = new color[100];
color fondo;

void setup(){
  size(500,500);
  for(int i = 0; i<100; i++){
    x[i] = random(width);
    dx[i] = random(-1,1);
    y[i] = random(height);
    dy[i] = random(-1,1);
    t[i] = random(50,100);
    relleno[i] = color(random(255),random(255),random(255));
  }
  fondo = color(255);
  background(fondo);
}


void draw(){  
  background(fondo);
  for(int i = 0; i<100; i++){
    fill(relleno[i]);
    noStroke();
    circle(x[i],y[i],t[i]);
    x[i]+= dx[i];
    y[i]+= dy[i];
  
  if(x[i]>width-t[i]/2){
    dx[i] *= -1;
  }  
  if(x[i]<t[i]/2){
    dx[i] *= -1;
  }
  
  if(y[i]>height-t[i]/2){
    dy[i] *= -1;
  }    
  if(y[i]<t[i]/2){
    dy[i] *= -1;
  }
  }
  
}
