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
       freq[i] = random(0.01,1);
       amp[i] = random((1f/n)*0.5,(1f/n)*3);
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

Fourier rojo;
Fourier verde;
Fourier azul;
Fourier tam;
Fourier py;
Fourier px;
void setup(){
  size(800,400);
  background(255);
  rojo = new Fourier(40);
  verde = new Fourier(40);
  azul = new Fourier(40);
  tam = new Fourier(40);
  py = new Fourier(40);
  px = new Fourier(40);
  float fq = 0.1;
  float amp = 150;
  for(int i = 0; i<width; i++){
    float x = i+px.getVal(40,i*0.05)*200;; 
    float y = height/2 + py.getVal(40,i*0.05)*200;
    float r = map(rojo.getVal(40,i*fq),-0.5,0.5,150,300);
    float g = map(verde.getVal(40,i*fq),-0.5,0.5,0,255);
    float b = map(azul.getVal(40,i*fq),-0.5,0.5,0,255);
    float t = tam.getVal(40,i*fq)*500;
    fill(r,g,b);
    noStroke();
    ellipse(x,y,t*0.5,t*0.5);
  }
}
