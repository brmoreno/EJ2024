import processing.video.*;
Capture cam;


class Part{
  PVector pos;
  PVector dir;
  float t;
  
  Part(){
    pos = new PVector(mouseX,mouseY);
    dir = PVector.random2D();
    t = random(20,60);
  }
  
  void display(){
    fill(cam.get(round(pos.x),round(pos.y)));
    ellipse(pos.x,pos.y,t,t);
  }
  
  void mover(){
    pos.add(dir);
  }
  
}

ArrayList <Part> parts;
void setup() {
  String[] cameras = Capture.list();
  cam = new Capture(this,cameras[0]);
  size(600, 400);
  cam.start();
  background(255);
  parts = new ArrayList <Part> ();
}

int t = 0;
void draw() {
  //image(cam, 0, 0, width, height);
  //for(int i = 0; i<cam.width;i+=10){
  //  for(int j = 0; j<cam.height;j+=10){
  //    color c = cam.get(i,j);
  //    stroke(c);
  //    float x = map(i,0,cam.width,0,width);
  //    float y = map(j,0,cam.height,0,height);
  //    strokeWeight(3);
  //    line(x,y,x+random(-40,40),y+random(-40,40));
  //  }
  //}
  
  
  //for(Part p:parts){
  //  p.display();
  //  p.mover();
  //}
  //if(mousePressed){
  //  parts.add(new Part());
  //}
  
  PImage crop = cam.get(0,t,width,1);
  image(crop,0,t);
  t++;
  if(t>width){
    t=0;
  }
}

void captureEvent(Capture c) {
  c.read();
}

void mousePressed(){
  
}
