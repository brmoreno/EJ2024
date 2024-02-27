class Avatar{
  
  float x;
  float y;
  float t;
  color c;
  float v;
  float a;
  
  Avatar(float v_){
    x = width/2;
    y = height/2;
    t = 60;
    c = color (255,0,0);
    v = v_;
    a = 0;
  }
  
  void display(){
    noStroke();
    fill(c);
    ellipse(x,y,t,t);
  }
  
  void mover(){
     float dx = cos(a)*v;
     float dy = sin(a)*v;
     x+=dx;
     y+=dy;     
     if(keyPressed){
       if(key == 'd'){
         a+=0.1;
       }
       if(key == 'a'){
         a-=0.1;
       }       
     }     
     x = constrain(x,t/2,width-t/2);
     y = constrain(y,t/2,height-t/2);
  }
  
  boolean colision(Enemigo e_){
    boolean colision = false;
    float dist = dist(this.x,this.y,e_.x,e_.y);
    float sumaRadios = this.t/2 + e_.t/2;
    if(dist < sumaRadios){
      colision = true;
    }
    return colision;
  }
  
  void captura(){
  }
  
}
