class Particula{
  PVector pos;
  PVector v;
  float t;
  color c;
  
  Particula(){
    pos = new PVector(random(width),random(height));
    v = PVector.random2D();
    t = 40;
    c = color(random(255),random(255),random(255));
  }
  
  void display(){
    fill(c);
    ellipse(pos.x,pos.y,t,t);
  }
  
  void mover(){
    pos.add(v);
  }  
}

class ParticulaA extends Particula{
  
  ParticulaA(){
    super();
  }
  
  void mover(){
    v = PVector.random2D();
    pos.add(v);
  }
}


class ParticulaB extends Particula{
  float r;
  ParticulaB(){
    super();
    r= random(-0.1,0.1);
  }
  
  void mover(){
    v.rotate(r);
    pos.add(v);
  }
}


ArrayList <Particula> particulas;
void setup(){
  size(500,500);
  particulas = new ArrayList <Particula> ();
  for(int i = 0; i<30; i++){
    particulas.add(new Particula());
    particulas.add(new ParticulaA());
    particulas.add(new ParticulaB());
  }
}

void draw(){
  background(255);
  for(Particula p:particulas){
    p.display();
    p.mover();
  }
}
