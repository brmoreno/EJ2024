import processing.video.*;

Movie video;
float tam = 0;
void setup(){
  size(500,250);
  video = new Movie(this,"sun.mp4");
  background(255);
    video.loop();

  while(!video.available()){
    tam =video.duration();
    
  }

  video.loop();
}

void draw(){
  if (video.available()) {
    video.read();
  }
  
  image(video,0,0,500,250);
  
}

