
PImage gato;

void setup(){
  size(740,380);
  gato  = loadImage("gato.jpg");
  background(255);

}

void draw(){
  int x = floor(random(width));
  int y = floor (random(height));
  int w = floor(random(50,100));
  int h = floor(random(50,100));
  PImage recorte = gato.get(x,y,w,h);
  tint(color(random(255),random(255),random(255)));
  image(recorte,x+random(-30,30),y+random(-30,30));
}
