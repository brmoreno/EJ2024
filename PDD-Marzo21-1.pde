class Lollipop {

  // We need to keep track of a Body and a width and height
  Body body;
  float w;
  float h;
  float r;
  color c;
  // Constructor
  Lollipop(float x, float y) {
    w = 4;
    h = 80;
    r = 30;
    // Add the box to the box2d world
    makeBody(new Vec2(x, y));
    c = color(random(255),0,random(255));
  }

  // This function removes the particle from the box2d world
  void killBody() {
    box2d.destroyBody(body);
  }

  // Is the particle ready for deletion?
  boolean done() {
    // Let's find the screen position of the particle
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Is it off the bottom of the screen?
    if (pos.y > height+w*h) {
      killBody();
      return true;
    }
    return false;
  }

  // Drawing the lollipop
  void display() {
    // We look at each body and get its screen position
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Get its angle of rotation
    float a = body.getAngle();

    rectMode(CENTER);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-a);
    fill(175);
    stroke(0);
    fill(255);
    rect(0,0,w,h);
    fill(c);
    ellipse(0, h/2, r*2, r*2);
    popMatrix();
  }

  // This function adds the rectangle to the box2d world
  
  void limitar(Vec2 centro, float r_){
     Vec2 pos = box2d.getBodyPixelCoord(body);
     float dist = dist(centro.x,centro.y,pos.x,pos.y);
     if(dist > r_){
       println("salió");
       
       Vec2 velActual = body.getLinearVelocity();
       body.setLinearVelocity(new Vec2(-velActual.x,-velActual.y));
     }
  }
  
  void makeBody(Vec2 center) {

    // Define the body and make it from the shape
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(center));
    body = box2d.createBody(bd);

    CircleShape circle = new CircleShape();
    circle.m_radius = box2d.scalarPixelsToWorld(r);
    Vec2 offset = new Vec2(0,h/2);
    offset = box2d.vectorPixelsToWorld(offset);
    circle.m_p.set(offset.x,offset.y);

    PolygonShape sd = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    sd.setAsBox(box2dW, box2dH);

    body.createFixture(sd,1.0);
    body.createFixture(circle, 1.0);

    // Give it some initial random velocity
    //body.setLinearVelocity(new Vec2(random(-5, 5), random(2, 5)));
    body.setAngularVelocity(random(-5, 5));
  }
}
