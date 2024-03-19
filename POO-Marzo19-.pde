
PImage gato;
int t = 10;

void setup(){
  size(740,380);
  gato  = loadImage("gato.jpg");
  background(255);

}

void draw(){
  t = 1+mouseX;
  for(int i = 0; i<gato.width; i+=t){
    for(int j = 0; j<gato.height; j+=t){
      
      stroke(gato.get(i,j));
      strokeWeight(random(t/2));
      line(i,j,i+random(-2*t,2*t),j+random(-2*t,2*t));
    }
  }
}
