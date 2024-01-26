float x;
float y;
float t;
float dt;

color fondo;
color relleno;

float r;
float g;
float b;
float dr;
float dg;
float db;


void setup(){
  size(500,500);
  x = 00;
  y = 250;
  t = 0;
  dt = 0.001;
  
  r = random(6);
  g = random(6);
  b = random(6);
  
  dr = random(-0.05,0.05);
  dg = random(-0.05,0.05);
  db = random(-0.05,0.05);
  
  fondo = color(255);
  relleno = color(255,0,0);
  background(fondo);
}



void draw(){  

  noStroke();
  
  
  t+=dt;
  
  r+=dr;
  g+=dg;
  b+=db;
  float rojo = sin(r)*255;
  float verde = sin(g)*255;;
  float azul = sin (b)*255;
  fill(rojo,verde,azul);
  float tam = sin(t)*400;
  circle(x%500,y,tam);
  x+= 1;
}
