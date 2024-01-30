//variables G.
float x;
float y;
float t;
color relleno;
color fondo;


void setup(){
  size(500,500);
  x = 200;
  y = 250;
  t = 100;
  relleno = color(255,0,0);
  fondo = color(255);
  background(fondo);
}


void draw(){
  background(fondo);
  fill(relleno);
  noStroke();
  circle(x,y,t);
  x+=1;
  if(x>500){
    //cuando la elipse choque con el límite izquierdo
    println("la elipse llegó al limite izquierdo");
    x+=-1;
  }
}
