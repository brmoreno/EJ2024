class Nodo{
  PVector pos;
  PVector v;
  float t;
  float f;
  
  Nodo(){
    pos = new PVector(random(width),random(height));
    t = random(50,100);
    f = random(-2,2);
    v = PVector.random2D();
  }
  
  void mover(){
    pos.add(v);
  }
}


ArrayList <Nodo> nodos;
float[] valores;
color [] colores;
void setup(){
  size(600,600,P2D);
  nodos = new ArrayList <Nodo>();
  colores = new color[6];
  for(int i = 0; i<6; i++){
    colores[i] = color(random(255),random(255),random(255));
  }
  for(int i = 0; i<100; i++){
    nodos.add(new Nodo());
  }
  
}

void draw(){
  for(Nodo n:nodos){
    n.mover();
  }
  loadPixels();
  valores = new float[pixels.length];
  float min = 0;
  float max = 0;
  for(int i = 0; i<pixels.length;i++){
    PVector pos = new PVector(i%width,i/width);
    float acum = 0;
    for(Nodo n:nodos){
      float dist = n.pos.dist(pos);
      if(dist<n.t){
        float val = map(dist,0,n.t,1,0);
        val*=n.f;
        acum+=val;
      }
    }
    valores[i]=acum;
    if(acum>max){
      max = acum;
    }
    if(acum<min){
      min = acum;
    }
  }

  for(int i = 0; i<pixels.length;i++){
    float val = map(valores[i],min,max,0,60);
    int anterior = floor(val)%6;
    int siguiente= ceil(val)%6;
    float dist = val%6-anterior;
    color c = lerpColor(colores[anterior],colores[siguiente],dist);
    pixels[i] = c;
  }
  updatePixels();
}
