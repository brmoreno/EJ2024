class Letra{
  char l;
  float x;
  float y;
  float r;
  float t;
  color c;
  int fuente;
  
  float dx;
  float dy;
  float dr;
  
  Letra(char l_, float x_, float y_){
    l = l_;
    x = x_;
    y = y_;
    r = random(TWO_PI);
    t = random(20,50);
    c = color(random(60),random(30,80),random(100,255));
    dx = random(-2,2);
    dy = random(-2,2);
    dr = random(-0.1,0.1);
    fuente = floor(random(20));
  }
  
  void display(){
    pushMatrix();
    translate(x,y);
    rotate(r);
    fill(c);
    textAlign(CENTER,CENTER);
    textFont(fuentes.get(fuente));
    textSize(t);
    text(l,0,0);
    popMatrix();
  }
  
  void mover(){
    x+=dx;
    y+=dy;
    r+=dr;
  }
  
  boolean salio(){
    boolean res = false;
    if(x<-t*2 || x>width+t*2 || y< -t*2 || y>height+t*2){
      res = true;
    }
    return res;
  }  
}

ArrayList <Letra> letras;
ArrayList <PFont> fuentes;

void setup(){
  size(600,600);
  letras = new ArrayList <Letra>();
  fuentes = new ArrayList <PFont>();
  String nombres [] = PFont.list();
  for(int i = 0; i<20; i++){
    fuentes.add(createFont(nombres[floor(random(nombres.length))],20));
  }
}

void draw(){
  background(255);
  for(Letra l:letras){
    l.display();
    l.mover();
  }
  
  for(int i=letras.size()-1; i>0; i--){
    if(letras.get(i).salio()){
      letras.remove(i);
    }
  }
}

void keyPressed(){
  Letra nueva = new Letra(key,mouseX,mouseY);
  letras.add(nueva);
}
