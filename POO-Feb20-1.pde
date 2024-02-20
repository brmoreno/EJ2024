class Rectangulo {
  //Atributos
  float x;
  float y;
  float w;
  float h;
  color c;
  
  //Constructor  
  Rectangulo(){
    x = 100;
    y = 100;
    w = 100;
    h = 50;
    c = color(255,0,0);
  }
  
  Rectangulo(float x_, float y_, float w_, float h_){
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    c = color(random(255),random(255),random(255));
  }
  
  
  //Métodos
  void display(){
    noStroke();
    fill(c);
    rect(x,y,w,h);
  }  
}

Rectangulo miRect;
Rectangulo otroRect;
 
void setup(){
  size(400,400);
  miRect = new Rectangulo();
  otroRect = new Rectangulo(200,200,100,100);
}

void draw(){
  background(255);
  miRect.display();
  otroRect.display();
}
