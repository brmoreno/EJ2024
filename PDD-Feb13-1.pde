class Browniano{
  PVector pos;
  PVector mov;
  float r;
  ArrayList <PVector> pvs;
  int n;
  float mY = 0,mX = 0 ,MY = 0 ,MX = 0;
  float alto;
  float ancho;
  
  Browniano(int n_){
    pos = new PVector(0,0);
    mov = PVector.random2D();
    pvs = new ArrayList <PVector>();
    n = n_;
    r = random(-0.2,0.2);
    for(int i = 0; i < n; i++){
      pvs.add(pos.copy());
      if(pos.y<mY){
        mY = pos.y;
      }
      if(pos.x<mX){
        mX = pos.x;
      }
      if(pos.y>MY){
        MY = pos.y;
      }
      if(pos.x>MX){
        MX = pos.x;
      }
      update();
    }
    alto = MY - mY;
    ancho = MX - mX;
  }
  
  void update(){
    PVector v = PVector.random2D();
    pos.add(v);    
  }
  
  void update1(){
    mov.rotate(random(-QUARTER_PI,QUARTER_PI));
    pos.add(mov);    
  }
  
 void update2(){
    r+= random(-0.01,0.01);
    mov.rotate(r);
    pos.add(mov);    
  }
}

Browniano r;
Browniano g;
Browniano b;

void setup(){
  r = new Browniano(2000);
  g = new Browniano(2000);
  b = new Browniano(2000);
  size(800,400);
  
  for(int i = 0; i<width; i++){
    noStroke();
    float rojo = map(r.pvs.get(i).y,r.mY,r.MY,-10,255*1.3);
    float verde = map(g.pvs.get(i).y,g.mY,g.MY,-10,255*1.3);
    float azul = map(b.pvs.get(i).y,b.mY,b.MY,-10,255*1.3);
    fill(rojo,verde,azul);
    rect(i,0,1,400);
  }  
}
