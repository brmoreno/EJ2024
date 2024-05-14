class Cubo{
  PVector p;
  PVector r;
  PVector o;
  color c;
  float t;
  float d;
  float dt;
  float amp;
  float dr;
  
  Cubo(float x_, float y_, float z_, float t_){
    p = new PVector(x_,y_,z_);
    r = new PVector(0,0,0);
    c = color(random(255),random(255),random(255));
    t = t_;
  }
  
  Cubo(float t_){
    p = PVector.random3D();
    o = p.copy();
    r = PVector.random3D();
    c = color(random(255),random(255),random(255));
    t = t_;
    d = random(TWO_PI);
    dt = random(-0.05,0.05);
    amp = 200;
    dr = random(-0.01,0.01);
  }
  
  void display(){
    pushMatrix();
    translate(p.x,p.y,p.z);
    rotateX(r.x);
    rotateY(r.y);
    rotateZ(r.z);
    fill(c);
    noStroke();
    box(t);
    popMatrix();
  }
  
  void mov(){
    d+=dt;
    o.rotate(dr);
    r.rotate(-dr);
    p = o.copy();
    float tam = abs(sin(d)*amp);
    p.setMag(tam);
  }
  
  void oscilar(){
    p.z = sin(dt+p.x*0.01)*100;
  }
  
  void movPerlin(){
    p.z = noise(p.x*0.02,p.y*0.02,dt)*300;
  }
  
}

ArrayList <Cubo> cubos;
float dt = 0;

void setup(){
  size(500,500,P3D);
  cubos = new ArrayList <Cubo>();
  for(int i = 0; i<50; i++){
    cubos.add(new Cubo(40));
  }
}

void draw(){
  background(255);
  lights();
  translate(width/2,height/2);
  for(Cubo c:cubos){
    c.display();
    c.mov();
  }
}
