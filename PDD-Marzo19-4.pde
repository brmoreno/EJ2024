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
  
  float getVal(int n_, float f_){
    float v = 0;
      for(int i = 0; i<n_; i++){
        float osc = sin(f_*freq[i] +fase[i])*amp[i];
        v+=osc;
      }
    return v;
  } 
}


Fourier x;
Fourier y;
Fourier z;

ArrayList <PVector> inicio;
ArrayList <PVector> fin;

void setup(){
  size(500,500,P3D);
  background(255);
  inicio = new ArrayList <PVector> ();
  fin = new ArrayList <PVector> ();
  x = new Fourier(10,20,40,4);
  y = new Fourier(10,20,40,4);
  z = new Fourier(10,20,40,4);
  
  for( int i = 0; i<1000; i++){
    float px = x.getVal(10,i*0.05);
    float py  = y.getVal(10,i*0.05); 
    float pz = z.getVal(10,i*0.05);
    fin.add(new PVector(px,py+i*0.3,pz));    
    px = x.getVal(7,i*0.05);
    py = y.getVal(7,i*0.05);
    pz = z.getVal(7,i*0.05);
    inicio.add(new PVector(px,py+i*0.3,pz));
  }
}

void draw(){
  background(255);
  lights();
  translate(width/2,height/2);
  rotateX(mouseX*0.01);
  rotateZ(mouseY*0.01);
  for(int i = 0; i<999; i++){
    PVector a = fin.get(i);
    PVector b = fin.get(i+1);
    PVector c = inicio.get(i+1);
    PVector d = inicio.get(i);
    stroke(0);
    fill(255,0,0);
    beginShape();
    vertex(a.x,a.y,a.z);
    vertex(b.x,b.y,b.z);
     vertex(c.x,c.y,c.z);
    vertex(d.x,d.y,d.z);
    
   
       
    endShape();
  }
}
