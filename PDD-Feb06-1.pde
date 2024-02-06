PVector p;

void setup(){
  size(400,400);
  p = new PVector(200,200);
  background(255);
for(int i = 0; i<3000; i++){
  PVector mov = PVector.random2D().mult(7);
  PVector ant = p.copy();
  p.add(mov);
  stroke(0);
  strokeWeight(0.5);
  line(ant.x,ant.y,p.x,p.y);
  noStroke();
  fill(255,0,120,5);
  ellipse(p.x,p.y,40,40);
  
  }
}
