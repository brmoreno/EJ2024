//variables G.
float x;
float dx;
float y;
float t;
color relleno;
color fondo;
color relleno2;

float x3;
float y3;
color relleno3;

void setup(){
  size(500,500);
  x = width/2;
  dx = 0.3;
  y = height/2;
  t = 100;
  relleno = color(255,0,0);
  fondo = color(255);
  background(fondo);
  relleno2 = color(0,255,0);
  
  x3 = width/2;
  y3 = height/2;
  relleno3 = color(0,0,255);
}


void draw(){
  background(fondo);
  fill(relleno);
  noStroke();
  circle(x,y,t);
  x+= dx;
  if(x>width-t/2){
    //cuando la elipse choque con el límite izquierdo
    println("la elipse llegó al limite izquierdo");
    dx *= -1;
  }  
  if(x<t/2){
    //cuando la elipse choque con e límite derecho
    dx *= -1;
  }
  
  fill(relleno2);
  circle(mouseX,mouseY,t);
  if(mousePressed){
    relleno2 = color(random(255),random(255),random(255));
  }
  
  fill(relleno3);
  circle(x3,y3,t);
  
  if(keyPressed){
     switch(key){
       case 'w':
         y3--;
       break;
       case 's':
         y3++;
       break;
       case 'a':
         x3--;
       break;
       case 'd':
         x3++;
       break;
     }
  }
}
