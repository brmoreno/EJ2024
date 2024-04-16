interface Particula{
  void display();
  void mover();
}


class ParticulaA implements Particula{
  PVector pos;
  PVector v;
  float t;
  color c;
  
  ParticulaA(){
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



class ParticulaB implements Particula{
  PVector pos;
  PVector v;
  float t;
  color c;
  
  ParticulaB(){
    pos = new PVector(random(width),random(height));
    v = PVector.random2D();
    t = 40;
    c = color(random(255),random(255),random(255));

  }
  void display(){
    fill(c);
    rectMode(CENTER);
    rect(pos.x,pos.y,t,t);
  }
  
  void mover(){
    v = PVector.random2D();
    pos.add(v);
  }
}

class ParticulaC implements Particula{
  PVector pos;
  PVector v;
  float t;
  color c;
  float r;
  
  ParticulaC(){
    pos = new PVector(random(width),random(height));
    v = PVector.random2D();
    t = 40;
    c = color(random(255),random(255),random(255));
    r = random(-0.1,0.1);
  }
  void display(){
    fill(c);
    textSize(t);
    text ("V",pos.x,pos.y);
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
    particulas.add(new ParticulaA());
    particulas.add(new ParticulaB());
    particulas.add(new ParticulaC());
  }
}

void draw(){
  background(255);
  for(Particula p:particulas){
    p.mover();
    p.display();
  }
}
