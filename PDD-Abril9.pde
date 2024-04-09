class Nodo{
  PVector pos;
  float r;
  PVector f;
  
  Nodo(){
    pos = new PVector(random(width),random(height));
    r = random(50,100);
    f = PVector.random2D().mult(random(1,4));
  }
    
  void display(){
    noStroke();
    fill(255,0,0,50);
    ellipse(pos.x,pos.y,r*2,r*2);
    stroke(0);
    line(pos.x,pos.y,pos.x+f.x*10,pos.y+f.y*10);
  }
}

class Agente{
  PVector pos;
  float t;
  color c;
  
  Agente(float x_, float y_){
    pos = new PVector(x_,y_);
    t = 10;
    c = color(255);
  }
  
  void display(){
    stroke(0);
    strokeWeight(0.5);
    fill(c);
    ellipse(pos.x,pos.y,t,t);
    t-=0.05;
    t = constrain(t,0,10);
  }
  
  void update(ArrayList <Nodo> nodos_){
    PVector mov = new PVector(0,0);
    for(Nodo n:nodos_){
      float distancia  = n.pos.dist(this.pos);
      if(distancia < n.r){
        float factor = map(distancia,0,n.r,1,0);
        PVector ff = n.f.copy().mult(factor);
        mov.add(ff);
      }
    }
    mov.normalize().mult(3);
    pos.add(mov);   
  }
}

Nodo uno;
ArrayList <Nodo> nodos;
ArrayList <Agente> agentes;
void setup(){
  size(500,500);
  uno = new Nodo();
  agentes = new ArrayList <Agente>();
  nodos = new ArrayList <Nodo>();
  nodos.add(uno);
  for(int i = 0; i<100; i++){
    nodos.add(new Nodo());
  }
  for(int i = 0; i<width; i+=10){
    for(int j = 0; j<height; j+=10){
      agentes.add(new Agente(i,j));
    }
  }
   background(255);
}

void draw(){
 
  
  for(Agente a:agentes){
    a.display();    
  }
  
    for(Agente a:agentes){
      a.update(nodos);   
    }  
}
