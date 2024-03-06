PVector p;
float pos[] = new float[500];


void setup(){
  size(800,400);
  p = new PVector (100,0);
  p.rotate(-QUARTER_PI);
  
}

void draw(){
  p.rotate(0.1);
  background(255);
  noFill();
  translate(150,200);
  line(0,0,p.x,p.y);
  ellipse(0,0,200,200);
  line(0,0,p.x,0);
  line(p.x,p.y,p.x,0);
  fill(0);
  ellipse(p.x,p.y,5,5);
  line(p.x,p.y,150,p.y);
  pos[499] = p.y;
  for(int i = 0; i<499; i++){
    pos[i] = pos[i+1];
  }
  for(int i=499; i>=0; i--){
    float x = 650-i;
    float y = pos[i];
    ellipse(x,y,3,3);
  }
}
