class Fourier {
  
  float [] fase;
  float [] freq;
  float [] amp;
  int n;
  
   Fourier(int n_,float min_,float max_, float fac_){
     n = n_;
     fase = new float[n];
     freq = new float[n];
     amp = new float[n];
     for(int i = 0; i<n; i++){
       fase[i] = random(TWO_PI);
       freq[i] = random(1)<0.5? random(1,fac_):random(1f/fac_,1);
       freq[i] = random(1)<0.5? freq[i]:-freq[i];
       amp[i] = random(min_,max_);
     }
   }
  
  float getVal(float f_){
    float v = 0;
      for(int i = 0; i<n; i++){
        float osc = sin(f_*freq[i] +fase[i])*amp[i];
        v+=osc;
      }
    return v;
  } 
}


PImage gato;
Fourier uno;
Fourier dos;

void setup(){
  size(740,379);
  gato = loadImage("gato.jpg");
  uno = new Fourier(15,1,20,4);
  dos = new Fourier(15,1,20,4);
}

void draw(){
  loadPixels();
  for(int i = 0; i<gato.width; i++){
    for(int j = 0; j<gato.height; j++){
      int dif = floor(uno.getVal(j*0.05));
      int dof = floor(dos.getVal(i*0.05));
      color c = gato.get(i+dif,j+dof);
      pixels[i+j*gato.width] = c;
    }
  }
  
  updatePixels();
}
