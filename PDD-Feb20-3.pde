class BrownPerlin{
  PVector pos;
  
  BrownPerlin(){
    pos = new PVector(random(width),random(height));
  }
  
  void mover(float v_){
    float perlin = noise(pos.x*v_,pos.y*v_);
    float angulo = perlin*TWO_PI*5;
    PVector mov = PVector.fromAngle(angulo);
    pos.add(mov);
  }
  
  void display(){
    noStroke();
    fill(0);
    ellipse(pos.x,pos.y,1,1);
  }
}

ArrayList <BrownPerlin> bps;

void setup(){
  size(500,500);
  bps = new ArrayList <BrownPerlin> ();
  for(int i = 0; i<1000; i++){
    bps.add(new BrownPerlin());
  }
  
  background(255);
}
void draw(){
  for(BrownPerlin bp:bps){
    bp.mover(0.01);
    bp.display();
  }
}
