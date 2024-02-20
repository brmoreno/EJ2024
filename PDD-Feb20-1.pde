class Nodo{
  PVector pos;
  Nodo ancla;
  ArrayList <Nodo> ramas;
  float probs[];
  int ancho [];
 
  Nodo(PVector p_){
    pos = p_;
    ramas = new ArrayList <Nodo>();
  }
  
  void setAncla(ArrayList <Nodo> nodos_){
    int es = 0;
    float distMin = 9000;
    for (int i = 0; i< nodos_.size(); i++){
      float dist = pos.dist(nodos_.get(i).pos);
      if(dist < distMin){
        distMin = dist;
        es = i;
      }
    }
   
   ancla = nodos_.get(es);
   nodos_.get(es).setRama(this);
  }
  
  void setRama(Nodo n_){
    ramas.add(n_);
  }
  
  void display(){
    ellipse(pos.x,pos.y,2,2);
    if(ancla != null){
      line(pos.x,pos.y,ancla.pos.x,ancla.pos.y);
    }
  }
  
  void display2(){

    if(ramas.size() != 0){
      for(int i = 0; i<ramas.size(); i++){
        stroke(0);
        strokeWeight(constrain(ancho[i]*0.1,0,10));
        line(pos.x,pos.y,ramas.get(i).pos.x,ramas.get(i).pos.y);
      }
    }
  }
  
  void setProbs(){
    if(ramas.size()!= 0){
      float  v = 1f/ramas.size();
      probs = new float[ramas.size()];
      ancho = new int [ramas.size()];
      for(int i = 0; i<ramas.size();i++){
        probs[i] = v*(i+1);
      }
     
      
    }
  }
  
  void juega (){
   
    
    if(ancho != null){
      if(ancho.length==1){
        ancho[0]++;
        ramas.get(0).juega();
      }
      else{
      float val = random(1);
      for(int i = 0; i<ancho.length;i++){
        if(probs[i]>val){
          ancho[i]++;
          ramas.get(i).juega();
          break;
        }
      }
      }
    }
  }
}

class Anillo{
  ArrayList <Nodo> nodos;
  
  Anillo(int n_, float min_, float max_){
    nodos = new ArrayList <Nodo> ();
    for(int i = 0; i< n_; i++){
      PVector p = PVector.random2D().mult(random(min_,max_));
      nodos.add(new Nodo(p));
    }
  }
  
  void anclar(Anillo a_){
    for(Nodo n:nodos){
      n.setAncla(a_.nodos);
    }
  }
  
  void setProbs(){
    for(Nodo n: nodos){
      n.setProbs();
    }
  }
  
  void display(){
    for(Nodo n: nodos){
      n.display2();
    }
  }
}

Anillo uno;
Anillo dos;
Anillo tres;
Anillo cuatro;
Anillo cinco;
Anillo seis;

void setup(){
  size(600,600);
  background(255);
  
  uno = new Anillo(1,0,0);
  dos = new Anillo(10,50,60);
  tres = new Anillo(30,100,110);
  cuatro = new Anillo(60,150,160);
  cinco = new Anillo(120,200,210);
  seis = new Anillo(240,250,260);

  dos.anclar(uno);
  tres.anclar(dos);
  cuatro.anclar(tres);
  cinco.anclar(cuatro);
  seis.anclar(cinco);
  
  uno.setProbs();
  dos.setProbs();
  tres.setProbs();
  cuatro.setProbs();
  cinco.setProbs();
  seis.setProbs();
  
  for(int i = 0; i<3000; i++){
  uno.nodos.get(0).juega();
  }
   
  strokeCap(PROJECT);
  translate(width/2,height/2);
  uno.display();
  dos.display();
  tres.display();
  cuatro.display();
  cinco.display();  
  seis.display();
}
