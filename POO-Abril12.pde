class Boton{
  float x,y;
  float r;
  boolean over;
  boolean press;
  
  Boton(float x_, float y_, float r_){
    x = x_;
    y = y_;
    r = r_;
    over = false;
    press = false;
  }
  
  void display(){
    noStroke();
    fill(0);
    ellipse(x,y,r*2,r*2);
  }
  
  void funcion(){
    float dist = dist(this.x,this.y,mouseX,mouseY);
    if(dist < this.r){
      over = true;
      press = false;
      if(mousePressed == true){
        over = false;
        press = true;
      }
    }
    else{
      over = false;
      press = false;
    }
  }
}


class BotonColor extends Boton{
  
  BotonColor(float x_, float y_, float t_){
    super(x_, y_, t_);
  }
  
  void display(){
    funcion();
    if(over == true){
      fill(0,0,255);
    }
    else if(press == true){
      fill(0,255,0);
    }
    else{
      fill(0);
    }
    noStroke();
    ellipse(x,y,r*2,r*2);    
  }
  
}

Boton uno;
Boton dos;

void setup(){
  size(500,500);
  uno = new Boton(100,250,50);
  dos = new BotonColor(250,250,50);
}

void draw(){
  background(255);
  uno.display();
  uno.funcion();
  dos.display();
  println(uno.over + " " + uno.press);
}
