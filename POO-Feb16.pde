class Particula{
  // Atributos;
  float x;
  float y;
  float dx;
  float dy;
  int t;
  color c;
  
  //Constructor;
  Particula(){
    x = width/2;
    y = height/2;
    dx = random(-2,2);
    dy = random(-2,2);
    t = round(random(30,80));
    c = color(random(255),random(255),random(255));
  }
  
  //Métodos;
  
  void display(){
    noStroke();
    fill(c);
    ellipse(x,y,t,t);
  }
  
  void mover(){
    x+=dx;
    y+=dy;
  }
  
  void rebota(){
    if(x<0 || x>width){
      dx*=-1;
    }
    if(y<0 || y>height){
      dy*= -1;
    }
  } 
}

Particula una;
Particula otra;

void setup(){
  size(500,500);
  una = new Particula(); 
  otra = new Particula();
}

void draw(){
  background(255);
  una.display();
  una.mover();
  una.rebota();
  otra.display();
  otra.mover();
  otra.rebota();
}
