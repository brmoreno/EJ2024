float x[] = new float [100];
float y[] = new float [100];
float ra[] = new float [100];
int r[] = new int [100];
int g[] = new int [100];
int b[] = new int [100];

float dx[] = new float [100];
float dy[] = new float [100];


void setup(){
  size(400,400); 
  for(int i = 0; i<100; i++){
    x[i] = random(width);
    y[i] = random(height);
    ra[i] = random(50,100);
    r[i] = round(random(0,70));
    g[i] = round(random(0,70));
    b[i] = round(random(0,70));
    dx[i] = random(-2,2);
    dy[i] = random(-2,2);
  }  
}

void draw(){ 
  loadPixels();
  for(int i = 0; i<pixels.length; i++){
    pixels[i] = color(0);
  }
  updatePixels();
  
  
  
  for(int i = 0; i<100; i++){
    x[i]+=dx[i];
    y[i]+=dy[i];
    if(x[i]<0 || x[i]>width){
      dx[i]*=-1;
    }
    if(y[i]<0 || y[i]>height){
      dy[i]*=-1;
    }
    miCirculo(round(x[i]),round(y[i]),round(ra[i]),r[i],g[i],b[i]);
  }
  
}


void mousePressed(){
  loadPixels();
  color c = pixels[mouseX+mouseY*width];
  println(c);
}
void miRect(int x_, int y_, int w_, int h_, int r_, int g_, int b_){
  loadPixels();
  for(int j = y_<0? 0: y_; j<y_+h_ && j<height;j++){
    for(int i = x_<0 ? 0:x_; i<x_+w_ && i<width ; i++ ){
      // si x+w >width; i itera hasta width;
      // i x+w es menor a width; i itera hasta x+w_
      int pos = j*height + i;
      color c = pixels[pos];
      float rojo = red(c);
      float verde = green(c);
      float azul = blue(c);
      rojo += r_;
      verde += g_;
      azul += b_;
      pixels[pos] = color(rojo,verde, azul);
    }
  }
  updatePixels();
}

void miCirculo(int x_, int y_, int ra_, int r_, int g_, int b_){
  loadPixels();
  for(int i = x_-ra_<0? 0:x_-ra_; i<x_+ra_ && i<width; i++){
    for (int j = y_-ra_<0? 0: y_-ra_; j<y_+ra_ && j<height ;j++ ){
      float dist = dist(x_,y_,i,j);
      if(dist<ra_){
        int pos = j*height + i;
        color c = pixels[pos];
        float factor = map(dist,0,ra_,1,0);
        int rojo = (c >> 16) & 0xFF;
        int verde = (c >> 8) & 0xFF;
        int azul = c & 0xFF;
        rojo += r_*factor;
        verde += g_*factor;
        azul += b_*factor;
        rojo = constrain(rojo,0,255);
        verde = constrain(verde,0,255);
        azul = constrain(azul,0,255);
        int alfa  = 255;
        alfa = alfa<< 24;
        rojo = rojo << 16;
        verde = verde << 8;        
        pixels[pos] = alfa |rojo|verde|azul;
      }
    }
  }
  
  updatePixels();
}
