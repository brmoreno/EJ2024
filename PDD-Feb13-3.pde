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

Browniano uno;
Browniano dos;
float escala = 1;
float rota = 0 ;
void setup(){
  size(500,500);
  uno = new Browniano(5000);
  dos = new Browniano(3000);
  println(dos.ancho + " " + dos.alto);
}

void draw(){
  background(255);
  stroke(0);
  noFill();
  beginShape();
  for(int i = 0; i<uno.n; i++){
    PVector p = uno.pvs.get(i).copy().mult(escala).rotate(rota).add(mouseX,mouseY);
    //vertex(p.x,p.y);
  }
  endShape();
  
  stroke(255,0,0);
  beginShape();
  float escalaX = width/dos.ancho;
  float escalaY = height/dos.alto;
  for(int i = 0; i<dos.n; i++){
    
    PVector p = dos.pvs.get(i).copy();
    p.x*=escalaX;
    p.y*=escalaY;
    p.add(abs(dos.mX*escalaX),abs(dos.mY*escalaY));
    vertex(p.x,p.y);
  }
  endShape();
  
  if(keyPressed){
    if(key == 'a'){
      escala-=0.1;
    }
    if(key == 's'){
      escala+=0.1;
    }
    if(key == 'z'){
      rota-=0.1;
    }
    if(key == 'x'){
      rota+=0.1;
    }
  }
}
