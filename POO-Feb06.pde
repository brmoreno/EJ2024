float r;

void setup(){
  size(500,500);
}

void draw(){
  background(255);
  fill(255,0,0);
  gato(mouseX,mouseY, r);
  
 if(mousePressed){
   r+= 0.1;
 }
  
}

void mousePressed(){
  
}



void gato(float x_, float y_, float r_){
  pushMatrix(); 
  translate(x_,y_);
  rotate(r_);
  translate(-250,-250); 
  fill(0);
  noStroke();
  ellipse(250,250,20,20);
  ellipse(220,220,15,15);
  ellipse(280,220,15,15);
  stroke(0);
  for(int i = 0; i<3; i++){
    line(170,250 + i*5,230,250+ i*5);    
  }
  for(int i = 0; i<3; i++){
    line(270,250 + i*5,320,250+ i*5);    
  }  
  fill(255,220,220);
  triangle(180,200,220,200,205,150);
  triangle(280,200,320,200,305,150);
  popMatrix();
}
