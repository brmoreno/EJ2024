int x = 350;
int y = 100;
int w = 100;
int h = 50;


void setup(){
  size(400,400);

  loadPixels();
  for(int i = 0; i<pixels.length; i++){
    pixels[i] = color(0);
  }
  updatePixels();
  for(int i = 0; i<100; i++){
    int x = round(random(width));
    int y = round(random(width));
    int w = round(random(100,200));
    int h = round(random(100,200));
    int r = round(random(0,40));
    int g = round(random(0,40));
    int b = round(random(0,40));
    miRect(x,y,w,h,r,g,b);
  }
  
  
  updatePixels();
 
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
