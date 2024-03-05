Nivel n;

void setup(){
  size(600,600);
  ArrayList <Enemigo> enemigos = new ArrayList <Enemigo> ();
  enemigos.add(new Enemigo(100,100,100,1)); 
  enemigos.add(new Enemigo(500,100,100,0)); 
  enemigos.add(new Enemigo(100,500,100,2)); 
  n = new Nivel(2,500,500,enemigos);
}

void draw(){
  background(255);
  n.display();
  n.update();
  switch(n.estado){
    case 0:
    println("SIGO JUGANDO");
    break;
    case 1:
    println("GANE");
    break;
    case 2:
    println("PERDÍ");
    break;
    
  }
}

class Nivel{
  Avatar elAvatar;
  Item elItem;
  ArrayList <Enemigo> enemigos;
  int estado; //0:sigo jugando, 1: gané; 2: perdí
  
  Nivel(float v_,float x_, float y_, ArrayList <Enemigo> enemigos_){
    elAvatar = new Avatar(v_);
    elItem = new Item(x_,y_);
    enemigos = enemigos_;
    estado = 0;
  }
  
  void display(){
    elAvatar.display();
    elItem.display();
    for(Enemigo e:enemigos){
      e.display();
    }
  }
  
  void update(){
    elAvatar.mover();
    for(Enemigo e:enemigos){
      e.mover();
      if(elAvatar.colision(e)){
        estado = 2;
      }
    }
    if(elAvatar.captura(elItem)){
      estado = 1;
    }
  }
  
  int estado(){
    return estado;
  }
}

class Avatar{
  
  float x;
  float y;
  float t;
  color c;
  float v;
  float a;
  String nombre;  
  
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
  
  boolean captura(Item i_){
    boolean colision = false;
    float dist = dist(this.x,this.y,i_.x,i_.y);
    float sumaRadios = this.t/2 + i_.t/2;
    if( dist < sumaRadios){
      colision = true;
    }
    return colision;
  }  
}


class Enemigo{
  float x;
  float y; 
  float t;
  color c;
  int comportamiento; // 0:estático, 1: aleatorio, 2: constante
  float dx;
  float dy;
  
  Enemigo( float x_, float y_, float t_, int comp_){
    x = x_;
    y = y_;
    t = t_;
    c = color(0,0,255);
    comportamiento = comp_;
    dx = random(-2,2);
    dy = random(-2,2);
  }

 void display(){
   noStroke();
   fill(c);
   ellipse(x,y,t,t);
  }

  void mover(){
    switch(comportamiento){
      case 0:
        estatico();
      break;
      case 1 :
        aleatorio();
      break;
      case 2:
        constante();
      break;
    }
  }
  
  void estatico(){
  }
  
  void aleatorio(){
    x+=random(-2,2);
    y+=random(-2,2);
  }
  
  void constante(){
    x+=dx;
    y+=dy;
    if(x>width-t/2 || x<t/2){
      dx*=-1;
    }
    if(y>height-t/2 || y<t/2){
      dy*=-1;
    }
  }  
}

class Item{
float x;
float y;
float t;
color c;

  Item(float x_ , float y_){
    x = x_;
    y = y_;
    t = 20;
    c = color(255,255,0);
  }
  void display(){
    noStroke();
    fill(c);
    ellipse(x,y,t,t);
  }  
}
