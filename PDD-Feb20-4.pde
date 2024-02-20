class PDoble{

  int n;
  float largoP1 = 100;
  float largoP2 = 100; 
  float masa1 = 20; 
  float masa2 = 20; 
  float a1 = -HALF_PI; 
  float a2 = -HALF_PI; 
  float va1 = 0; 
  float va2 = 0; 
  float g = 1; 
  float cx = 0, cy = 0; 
  ArrayList <PVector> pvs1;
  ArrayList <PVector> pvs2;
  
  
  
  
  PDoble(int n_) {
     n = n_;
     pvs1 = new ArrayList <PVector>();
     pvs2 = new ArrayList <PVector>();
     for(int i = 0; i<n_; i++){
       update();
     }
  }
  
  void update() {
    float n1 = -g * (2 * masa1 + masa2) * sin(a1);
    float n2 = -masa2 * g * sin(a1-2*a2);
    float n3 = -2*sin(a1-a2)*masa2;
    float n4 = va2*va2*largoP2+va1*va1*largoP1*cos(a1-a2);
    float n5 = largoP1 * (2*masa1+masa2-masa2*cos(2*a1-2*a2));
    float na1 = (n1 + n2 + n3*n4) / n5;  
    n1 = 2 * sin(a1-a2);
    n2 = (va1*va1*largoP1*(masa1+masa2));
    n3 = g * (masa1 + masa2) * cos(a1);
    n4 = va2*va2*largoP2*masa2*cos(a1-a2);
    n5 = largoP2 * (2*masa1+masa2-masa2*cos(2*a1-2*a2));
    float na2 = (n1*(n2+n3+n4)) / n5;
    float x1 = cx+largoP1 * sin(a1);
    float y1 = cy+largoP1 * cos(a1);
    float x2 = x1 + largoP2 * sin(a2);
    float y2 = y1 + largoP2 * cos(a2);
    pvs1.add(new PVector(x1,y1));
    pvs2.add(new PVector(x2,y2));
    va1 += na1;
    va2 += na2;
    a1 += va1;
    a2 += va2;
  }
}

PDoble uno;

void setup(){
  size(1000,500);
  background(255);
  uno = new PDoble(2000);
  translate(0,height/2);
  float r = 0;
  for(PVector p:uno.pvs2){
    r+=0.5;
    p.add(r,0);
  }
  noFill();
  stroke(0);
  beginShape();
  for(PVector p:uno.pvs2){
    vertex(p.x,p.y);
  }
  endShape();
  
  for(int i = 0; i<uno.n; i+=100){
    PVector p = uno.pvs2.get(i);
    color c = color(random(255),random(255),random(255));
    float t = random(30,50);
    fill(c);
    noStroke();
    ellipse(p.x,p.y,t,t);
  }
}
