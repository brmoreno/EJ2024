float x;
float z;
void setup(){
  size(400,400);
}

void draw(){
  x+=0.01;
  z+=0.01;
  background(255);
  stroke(0);
  for(int i = 0; i<width; i+=10){
    for(int j = 0; j<height; j+=10){
      float r= noise(x+i*0.01,j*0.01,z)*255;
      float g= noise(x+i*0.01+5,j*0.01+6,z+3)*255;
      float b= noise(x+i*0.01+2,j*0.01+23,z+1)*255;
      fill(r,g,b);
      rect(i,j,10,10);
    }
  }
}
