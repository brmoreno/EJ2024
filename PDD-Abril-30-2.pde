PShape modelo;

class Nodo1{
  PVector pos;
  float t;
  float f;
  float r;
  color c;
  
  Nodo1(){
    pos = PVector.random3D().mult(100);
    t = random(20,50);
    f = random(-50,50);
    r = random(-0.01,0.01);
    c = color(random(255),random(255),random(255));
  }
  
  void rotar(){
    pos.rotate(r);
  }
}

ArrayList <Nodo1> nodos1;

void setup(){
  size(600,600,P3D);
  modelo = loadShape("ico.obj");
  nodos1 = new ArrayList <Nodo1>();
  for(int i = 0; i<100; i++){
    nodos1.add(new Nodo1());
  }
}

void draw(){
  lights();
  background(0);
  translate(width/2,height/2);
  rotateX(mouseX*0.01);
  rotateZ(mouseY*0.01);
  int n = modelo.getChildCount();
  
  for(Nodo1 no: nodos1){
    no.rotar();
  }
  
  for(int i = 0; i<n; i++){
    PShape p = modelo.getChild(i);
    int m = p.getVertexCount();
    beginShape();
    noStroke();
    fill(255,0,0);
    for(int j = 0; j<m;j++ ){
      PVector pv = p.getVertex(j);
      float acum = 0;
      for(Nodo1 no:nodos1){
        float dist = no.pos.dist(pv);
        if(dist < no.t){
          float val = map(dist,0,no.t,1,0);
          val*=no.f;
          acum+=val;
        }
      }
      float magAct = pv.mag();
      pv.setMag(magAct+acum);
      vertex(pv.x,pv.y,pv.z);
    }
    endShape();
  }
}
