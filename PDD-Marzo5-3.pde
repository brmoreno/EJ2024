class Fourier {
  
  float [] fase;
  float [] freq;
  float [] amp;
  int n;
  
   Fourier(int n_){
     n = n_;
     fase = new float[n];
     freq = new float[n];
     amp = new float[n];
     for(int i = 0; i<n; i++){
       fase[i] = random(TWO_PI);
       freq[i] = random(0.1,1);
       amp[i] = random((1f/n)*0.2,(1f/n)*4);
     }
   }
  
  float getVal(int n_, float f_){
    float v = 0;
      for(int i = 0; i<n_; i++){
        float osc = sin(f_*freq[i] +fase[i])*amp[i];
        v+=osc;
      }
    return v;
  } 
}

Fourier uno;

void setup(){
  size(800,400);
  background(255);
  uno = new Fourier(20);
  float fq = 0.1;
  float amp = 150;
  for(int i = 0; i<width; i++){
    float x = i;
    float y = sin(i*fq)*amp;
    fill(255,0,0);
    noStroke();
    ellipse(x,y+height/2,3,3);
    
    y = uno.getVal(20,i*fq)*amp;
    fill(0,0,255);
    noStroke();
    ellipse(x,y+height/2,3,3);
  }
}
