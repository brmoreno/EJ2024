PFont fuente1;
PFont fuente2;
String texto;

void setup(){
  size(600,600);
  texto = "foo bar baz qux";
  String nombres[] = PFont.list();
  printArray(nombres);
  fuente1 = createFont(nombres[floor(random(nombres.length))],50);
  fuente2 = loadFont("Kokonor-48.vlw");
}

void draw(){
  background(255);
  fill(255,0,0);
  textFont(fuente2);
  textSize(1+mouseX);
  text(texto, 100,300);
  line(100,300,400,300);
}

void keyPressed(){
  texto = "otra cosa";
}
