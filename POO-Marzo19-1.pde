class Gato{
  PVector pos;
  PVector v;
  float t;
  float a;
  float da;
  
  Gato(){
    pos = new PVector(random(width),random(height));
    v = PVector.random2D();
    t = random(.1,.3);
    a = random(TWO_PI);
    da = random(-0.05,0.05);
  }
  
  void display(){
    imageMode(CENTER);
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(a);
    image(gato,0,0,gato.width*t,gato.height*t);
    popMatrix();
  }
  
  void mover(){
    a+=da;
    pos.add(v);
    if(pos.x<0 || pos.x>width){
      v.x*=-1;
    }
    if(pos.y<0 || pos.y>height){
      v.y*=-1;
    }
  }
}



PImage gato;
ArrayList <Gato> gatos;
void setup(){
  size(740,380);
  gato  = loadImage("gato.jpg");
  gatos = new ArrayList <Gato>();
  for(int i = 0; i<50; i++){
    gatos.add(new Gato());
  }
}

void draw(){
  background(255);
  for(Gato g:gatos){
    g.display();
    g.mover();
  }
}
