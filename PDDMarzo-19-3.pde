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
Fourier rojo;
Fourier verde;
Fourier azul;

void setup(){
  size(740,379);
  gato = loadImage("gato.jpg");
  rojo = new Fourier(15,1,10,4); 
  verde = new Fourier(15,1,10,4);
  azul = new Fourier(15,1,10,4);
}

void draw(){
  loadPixels();
  for(int i = 0; i<gato.pixels.length; i++){
    color c = gato.pixels[i];
    float r = red(c);
    float g = green(c);
    float b = blue(c);
    float ro = 128 + rojo.getVal(r*0.01)*3;
    float ve = 128 + verde.getVal(g*0.01)*3;
    float az = 128 + azul.getVal(b*0.01)*3;
    
    pixels[i] = color(ro,ve,az);
  }  
  updatePixels();
}
