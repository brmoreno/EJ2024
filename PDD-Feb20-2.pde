color cs[] = new color[4];


void setup(){
  loadPixels();
  size(500,500);
  for(int i = 0; i<4; i++){
    cs[i] = color(random(255),random(255),random(255));
  }
  
  for( int i = 0; i<width; i++){
    for(int j = 0; j<height; j++){
      int pix = i +j*width;
      int perlin = floor(noise(i*0.01,j*0.01)*80)%4;
      color c = cs[perlin];
      pixels[pix] = c;
    }
  }
  updatePixels();
}
