float vp = 0.5;
float dx;
float dy;
float z = 0;

void setup(){
  size(500,500);
}

void draw(){
  loadPixels();
  for(int i = 0; i< pixels.length; i++){
    int x = i%width;
    int y = i/width;
    float val = noise(x*vp +dx,y*vp +dy,z)*255;
    color c = color(val);
    pixels[i] = c;
  }
  updatePixels();
}

void keyPressed(){
  if(key == 'a'){
    vp-=0.01;
  }
  if(key == 's'){
    vp+=0.01;
  }
  if(key == 'q'){
    dx-=0.1;
  }
  if(key == 'w'){
    dx+=0.1;
  }
  if(key == 'z'){
    dy-=0.1;
  }
  if(key == 'x'){
    dy+=0.1;
  }
  
  if(key == 'g'){
    z-=0.1;
  }
  if(key == 'h'){
    z+=0.1;
  }
}
