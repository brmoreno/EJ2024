PShape ps;

void setup(){
  size(500,500,P3D);
  ps = loadShape("untitled.obj");
}

void draw(){
  background(255);
  lights();
  pushMatrix();
  translate(width/2,height/2);
  rotateX(mouseX*0.01);
  rotateY(mouseY*0.01);
  scale(200);
  fill(255,0,0);
  int gc = ps.getChildCount();
  for(int i = 0; i<gc; i++){
    PShape pgc = ps.getChild(i);
    pgc.disableStyle();
    fill(random(255),random(255),random(255));
    shape(pgc);
  }
  popMatrix();
}
