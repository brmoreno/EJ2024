class Brocha{
  PVector pos;
  PVector v;
  float t;
  float a;
  float da;
  color c;
  
  Brocha(){
    pos = new PVector(random(width),random(height));
    v = PVector.random2D();
    t = random(20,50);
    a = random(TWO_PI);
    da = random(-0.05,0.05);
    c = gato.get(round(pos.x),round(pos.y));
  }
  
  void display(){
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(a);
    noStroke();
    color actual = gato.get(round(pos.x),round(pos.y));
    c = lerpColor(c,actual,0.1);
    fill(c);
    rect(0,0,t,t/4);
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
ArrayList <Brocha> brochas;

void setup(){
  size(740,380);
  gato  = loadImage("gato.jpg");
  background(255);
  brochas = new ArrayList <Brocha>();
  for(int i = 0; i<50; i++){
    brochas.add(new Brocha());
  }
  background(255);
}

void draw(){
  for(Brocha b:brochas){
    b.display();
    b.mover();
  }
}
