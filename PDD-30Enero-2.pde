class Oscilador{
  float val;
  float delta;
  float min;
  float max; 
  
  Oscilador (float min_, float max_){
    val = random(TWO_PI);
    delta = random(-0.05,0.05);
    min = min_;
    max = max_;
  }
  
  void update(){
    val+=delta;
  }
  
  float getVal(){
    update();
    float valSin = sin(val);
    float valEsc = map(valSin,-1,1,min,max);
    return valEsc;
  }
}


class Particula {
  PVector pos;
  Oscilador t;
  Oscilador r, g, b;
  PVector dir;
  float dr ;
  
  Particula() {
    pos = new PVector(random(width), random(height));
    t = new Oscilador(50,150);
    r = new Oscilador(-50,150);
    g = new Oscilador(-50,150);
    b = new Oscilador(-50,150);
    dir = PVector.random2D();
    dr = random(-0.1,0.1);
  }

  void mover() {
    pos.add(dir);
    dir.rotate(dr);
    if (pos.x<0 || pos.x>width) {
      dir.x*=-1;
    }
    if (pos.y<0 || pos.y>height) {
      dir.y*=-1;
    }    
  }

  void display() {
    int x_ = round(pos.x);
    int y_ = round(pos.y);
    int ra_ = round(t.getVal());
    int r_ = round(r.getVal());
    int g_ = round(g.getVal());;
    int b_ = round(b.getVal());
    loadPixels();
    for (int i = x_-ra_<0? 0:x_-ra_; i<x_+ra_ && i<width; i++) {
      for (int j = y_-ra_<0? 0: y_-ra_; j<y_+ra_ && j<height; j++ ) {
        float dist = dist(x_, y_, i, j);
        if (dist<ra_) {
          int pos = j*height + i;
          color c = pixels[pos];
          float factor = map(dist, 0, ra_, 1, 0);
          int rojo = (c >> 16) & 0xFF;
          int verde = (c >> 8) & 0xFF;
          int azul = c & 0xFF;
          rojo += r_*factor;
          verde += g_*factor;
          azul += b_*factor;
          rojo = constrain(rojo, 0, 255);
          verde = constrain(verde, 0, 255);
          azul = constrain(azul, 0, 255);
          int alfa  = 255;
          alfa = alfa<< 24;
          rojo = rojo << 16;
          verde = verde << 8;
          pixels[pos] = alfa|rojo|verde|azul;
        }
      }
    }
    updatePixels();
  }
}


ArrayList <Particula> particulas;
void setup() {
  size(500,500);
  particulas = new ArrayList <Particula>();
  for(int i = 0; i<100; i++){
    particulas.add(new Particula());
  }
}

void draw() {
  loadPixels();
  for (int i = 0; i<pixels.length; i++) {
    pixels[i] = color(0);
  }
  updatePixels();
  for(Particula p:particulas){
    p.mover();
    p.display();
  }
}
