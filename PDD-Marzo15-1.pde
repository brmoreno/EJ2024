class Epi{
  float fase[];
  float freq[];
  float amp[];
  int n;
  
  Epi(int n_, float min_, float max_, float ffreq_){
    n = n_;
    fase = new float[n];
    freq = new float[n];
    amp = new float[n];
    for(int i = 0; i<n; i++){
      fase[i] = random(TWO_PI);
      freq[i] = random(1)<0.5? random(1,ffreq_) : 1f/random(1,ffreq_);
      freq[i] = random(1)<0.5? freq[i]:-freq[i];
      amp[i] = random(min_,max_);
    }
  }
  
  PVector[] getVal(float v_){
    PVector actual = new PVector(0,0);
    
    PVector res[] = new PVector[n+1];
    res[0] = actual.copy();
    for(int i = 0; i<n; i++){
      float x = cos(v_*freq[i] + fase[i])*amp[i];
      float y = sin(v_*freq[i] + fase[i])*amp[i];
      actual.add(x,y);
      res[i+1] = actual.copy();
    }
    return res;
  }
}


Epi uno;
float a;
ArrayList <PVector> pvs;

void setup(){
  uno = new Epi(10,10,50,4);
  size(600,600);
  background(255);
}

void draw(){
  

}

void mousePressed(){
  pvs = new ArrayList <PVector> ();
  pvs.add(new PVector(mouseX,mouseY));
}


void mouseDragged(){
  pvs.add(new PVector(mouseX,mouseY));
}

void mouseReleased(){
  Epi nuevo = new Epi(10,10,40,4);
  float a = 0;
  float da = 0.05;
  for(PVector p:pvs){
    PVector [] pos = nuevo.getVal(a);
    stroke(0,45);
    strokeWeight(10);
    noFill();    
    beginShape();
    for(PVector q:pos){
      q.add(p);
      vertex(q.x,q.y);
    }
    endShape();
    a+=da;
  }
}
