class Nodo{
  PVector pos;
  float t;
  float v;
  
  Nodo(){
    pos = new PVector(random(width), random (height));
    t = random(50,300);
    v = random(-50,50);
  }
  
  Nodo(float x_, float y_, float t_, float v_){
    pos = new PVector(x_,y_);
    t = t_;
    v = v_;
  }
}

class Agente{
  PVector p;
  PVector original;
  
  Agente(float x_, float y_){
    p = new PVector(x_,y_);
    original = p.copy();
  }
  
  void display(){
    noStroke();
    color c = gato.get(round(p.x),round(p.y));
    fill(c);
    rect(original.x,original.y,1,1);
  }
  
  void update(ArrayList <Nodo> nodos_){
    PVector sum = new PVector(0,0);
    for(Nodo n: nodos_){
      float dist = n.pos.dist(p);
      if(dist<n.t){
        PVector dir = n.pos.copy().sub(p);
        dir.normalize();
        float inten = map(dist,0,n.t,1,0)*n.v;
        dir.mult(inten);
        sum.add(dir);
      }
    }
    p.add(sum);
  }
}

ArrayList <Nodo> nodos;
ArrayList <Agente> agentes;
PImage gato;
void setup(){
  size(450,450);
  gato = loadImage("gatocubrebocas.png");
  nodos = new ArrayList <Nodo> ();
  agentes = new ArrayList <Agente> ();
  
  nodos.add(new Nodo(250,250,300,50));
  
  for(int i = 0; i<100; i++){
    nodos.add(new Nodo());
  }
  
  for(int i = 0; i<width; i+=1){
    for(int j = 0; j<height; j+=1){
      agentes.add(new Agente(i,j));
    }
  }
    background(255);


  for(Agente a:agentes){
    a.update(nodos);
    a.display();    
  }
  
}
