class Lorenz{
  float x = 0.01;
  float y = 0;
  float z = 0;
  float a = 10.5;
  float b = 28;
  float c = 2.5;
  float dt = 0.01;
  ArrayList <PVector> pvs;
  int n;
  Lorenz(int pasos_){ 
    n = pasos_;
    pvs = new ArrayList <PVector>();
    for(int i = 0; i<pasos_;i++){
      PVector pa = new PVector(x,y,z);
      pvs.add(pa);
      update();
    }
  }
  
  Lorenz(float a_, float b_, float c_, int pasos_){
    a = a_;
    b = b_;
    c = c_;
    n = pasos_;
    pvs = new ArrayList <PVector>();
    for(int i = 0; i<pasos_;i++){
      PVector pa = new PVector(x,y,z);
      pvs.add(pa);
      update();
    }
  }
  
  void update(){
    float dx = (a * (y - x))*dt;
    float dy = (x * (b - z) - y)*dt;
    float dz = (x * y - c * z)*dt;
    x += dx;
    y += dy;
    z += dz;    
  }
  
}

Lorenz uno;
Lorenz otro;
float rx;
float ry;
float escala = 5;
void setup(){
  size(500,500,P3D);
  uno = new Lorenz(4000);
  otro = new Lorenz(random(25),random(25),random(25),4000);
}

void draw(){
  background(0);
 
  strokeWeight(10);
  rotateX(rx);
  rotateY(ry);
  for(int i = 0; i<uno.n-1;i++){
    stroke(otro.pvs.get(i).mag()*30);
    PVector act = uno.pvs.get(i).copy();
    PVector sig = uno.pvs.get(i+1).copy();
    act.mult(escala).add(i*0.1,height/2);
    sig.mult(escala).add(i*0.1,height/2);
    line(act.x,act.y,act.z,sig.x,sig.y,sig.z);    
  }
}

void keyPressed(){
  if(key == 'q'){
    escala+=0.1;
  }
  if(key == 'w'){
    escala-=0.1;
  }
  
  if(key == 'a'){
    rx+=0.1;
  }
  if(key == 's'){
    rx-=0.1;
  }
  
  if(key == 'z'){
    ry+=0.1;
  }
  if(key == 'x'){
    ry-=0.1;
  }
}
