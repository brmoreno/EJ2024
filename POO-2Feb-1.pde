size(500,500);
background(255);
for(int i = 0; i<500 ; i+=10){
  noStroke();
  fill(i,i*0.5,0);
  float y = 200 + sin(i*0.01)*100;
  rect(i,y,5,200);
}
