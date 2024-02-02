size(500,500);
background(255);
for(int i = 0; i<500 ; i++){
  float x1 = random(width);
  float y1 = random(height);
  float x2 = random(width);
  float y2 = random(height);
  float x3 = random(width);
  float y3 = random(height);
  float r = random(0,50);
  float g = random(255);
  float b = random(100,255);
  float ancho = random(20);
  stroke(r,g,b);
  noFill();
  strokeWeight(ancho);
  bezier(width/2,height/2,x1,y1,x2,y2,x3,y3);
}
