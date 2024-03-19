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
  
  PVector getLastPV(float v_){
    PVector[] lista = this.getVal(v_);
    return lista[lista.length-1];
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
ArrayList <PVector> pvs;
void setup(){
  size(600,600);
  
  
  background(255);
  
  float nx = 10;
  float ny = 6;
  
  for(int j = 0; j<ny; j++){
    uno = new Epi(6,10,15,4);
    pvs = new ArrayList <PVector> ();
  
    float a = 0;
    float da = 0.1;
    
    PVector suma = new PVector(0,0);
    for(int i = 0; i<100;i++){
      pvs.add(uno.getLastPV(a));
      suma.add(uno.getLastPV(a));
      a+=da;
    }
    suma.div(pvs.size());
    for(PVector p: pvs){
      p.sub(suma);
    }
       
    for(int i = 0; i<nx; i++){
      beginShape();
      noFill();
      stroke(0,0,255);
      strokeWeight(2);
      if(i%2 == 0){
        for(PVector p:pvs){
          vertex(p.x + i*width/nx,p.y +j*height/ny);
        }
      }
      else{
        for(PVector p:pvs){
          vertex(p.x*-1 + i*width/nx,p.y +j*height/ny);
        }
      }
      endShape();
    }
  }
  
}
