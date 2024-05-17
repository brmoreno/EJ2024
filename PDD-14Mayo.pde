class Circulo{
  float t;
  color c;
  Body b;
  
  Circulo(float x_, float y_, float t_){
    t = t_;
    c = color(random(255),random(255),random(255));
    //defino el cuerpo
    BodyDef bd  = new BodyDef();
    // lo ubico en el espacio
    Vec2 pos = box2d.coordPixelsToWorld(x_,y_);
    bd.position.set(pos);
    //establezco el tipo de cuerpo
    bd.type = BodyType.DYNAMIC;
    //defino su forma
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(t_/2);
    //defino sus propiedades
    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    fd.density = 0.1;
    fd.restitution = 0.3;
    fd.friction = 0.1;
    
    //uno el cuerpo y las propiedades
    b = box2d.createBody(bd);
    b.createFixture(fd);
    //b.setLinearVelocity(new Vec2(random(-5,5),random(-5,5)));
    //b.setAngularVelocity(random(-2,2));
  }
  
  void moverHacia(float x_, float y_){
    Vec2 obj = box2d.coordPixelsToWorld(x_,y_);
    Vec2 pos = b.getWorldCenter();
    Vec2 dir = obj.sub(pos);
    dir.normalize();
    dir.mulLocal(20);
    b.applyForce(dir,b.getWorldCenter());
  }
  
  void display(){
    Vec2 pos = box2d.getBodyPixelCoord(b);
    float a = b.getAngle();
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(-a);
    fill(c);
    ellipse(0,0,t,t);
    line(0,0,0,t/2);
    popMatrix();
  }  
}

import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;

ArrayList <Circulo> circulos;
void setup(){
  size(600,600);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0,0);
  circulos = new ArrayList <Circulo>();
  for(int i = 0; i<100; i++){
    circulos.add(new Circulo(random(width),random(height),random(20,40)));
  }
  
}

void draw(){
  background(255);
  box2d.step();
  for(int i = 0; i<circulos.size();i++){
    
    circulos.get(i).display();
    if(mousePressed){
     
      if(i%2 == 0){
        circulos.get(i).moverHacia(100,300);
      }
      else{
        circulos.get(i).moverHacia(500,300);
      }
    }
  }  
}
