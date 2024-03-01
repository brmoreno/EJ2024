PVector centro;
PVector foo;
PVector epiciclo;
PGraphics fondo;


void setup(){
  size(600,600);
  centro = new PVector(width/2,height/2);
  foo = new PVector (200,0);
  epiciclo = new PVector(50,0);
  fondo = createGraphics(width,height);
   fondo.beginDraw();
   fondo.background(255);
   fondo.endDraw();
}

void draw(){
  float dr = PI/256;
  foo.rotate(dr);
  epiciclo.rotate(dr*6);
  stroke(0);
  fondo.beginDraw();
  fondo.noStroke();
  fondo.fill(255,0,0);
  fondo.ellipse(centro.x+foo.x +epiciclo.x,centro.y+foo.y+epiciclo.y,5,5);
  fondo.endDraw();
  image(fondo,0,0);
  line(centro.x,centro.y,centro.x+foo.x,centro.y+foo.y );
  line(centro.x+foo.x,centro.y+foo.y,centro.x+foo.x +epiciclo.x,centro.y+foo.y+epiciclo.y);
  noFill();
  ellipse(centro.x,centro.y,foo.mag()*2,foo.mag()*2);
  ellipse(centro.x+foo.x,centro.y+foo.y,epiciclo.mag()*2,epiciclo.mag()*2);
  fill(0);
  ellipse(centro.x+foo.x,centro.y+foo.y,5,5);
  ellipse(centro.x+foo.x +epiciclo.x,centro.y+foo.y+epiciclo.y,5,5);
}
