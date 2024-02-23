class Girador{
  float x;
  float y;
  float w;
  float h;
  color c;
  float r;
  float dr;
  
  Girador(float x_, float y_, float w_, float h_){
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    c = color(random(255),random(255),random(255));
    r= 0;
    dr = 0.1; 
  }
  
  void display(){
    pushMatrix();
    translate(x,y);
    rotate(r);
    fill(c);
    rectMode(CENTER);
    rect(0,0,w,h);
    popMatrix();
  }
  
  void gira1(){
    r+=dr;
  }
  void gira2(){
    r-=dr;
  }  
}

class Saltador{
  float x;
  float y;
  float w;
  float h;
  color c;
  float osc;
  float dosc;
  
  Saltador(float x_, float y_, float w_, float h_){
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    c = color(random(255),random(255),random(255));
    osc = 0;
    dosc = 0.1;
  }
  
  void display(){
    fill(c);
    float dy = abs(sin(osc)*h);
    rectMode(CORNER);
    rect(x,y-dy,w,-h);
    osc += dosc;
  }
}

class Cambiador{
  float x;
  float y;
  float w;
  float h;
  color c1;
  color c2;
  
  Cambiador(float x_, float y_, float w_, float h_){
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    c1 = color(random(255),random(255),random(255));
    c2 = color(random(255),random(255),random(255));
  }
  
  void display(){
    fill(c1);
    if(mouseX>x && mouseX<x+w && mouseY>y && mouseY<y+h){
      //si el mouse está sobre el Cambiador
      fill(c2);
    }
    rectMode(CORNER);
    rect(x,y,w,h);
  }
}

Girador uno;
Saltador dos;
Cambiador tres;


void setup(){
  size(500,500);
  uno = new Girador(100,200,100,100);
  dos = new Saltador(200,250,100,100);
  tres = new Cambiador(350,150,100,100);
}

void draw(){
  background(255);
  uno.display();
  dos.display();
  tres.display();
  uno.gira2();
}
