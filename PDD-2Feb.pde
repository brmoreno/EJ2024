class Palabra{
  String texto;
  PGraphics textura;
  PGraphics mancha;
  int t;
  float x,y;
  PFont fuente;
  float Ascendente;
  float Descendente; 
  Palabra(String texto_,int t_, float x_, float y_, PFont fuente_){
    texto = texto_;
    t = t_;
    x = x_;
    y = y_;
    fuente = fuente_;
    textFont(fuente);
    textSize(t);
    float ancho = textWidth(texto);
    Ascendente = textAscent();
    Descendente = textDescent();
    textura = createGraphics(round(ancho),round(Ascendente+Descendente));
    mancha = createGraphics(round(ancho),round(Ascendente+Descendente));
     
  }
  
  void display(){
    mancha.beginDraw();
    mancha.background(0);
    mancha.fill(255);
    mancha.textFont(fuente);
    mancha.textSize(t);
    mancha.text(texto,0,Ascendente);
    mancha.endDraw();
    
    //textura.beginDraw();
    //for(int i = 0; i<textura.width;i+=10){
    // for(int j = 0; j<textura.height;j+=10){
    //    textura.fill(random(255),random(255),random(255));
    //    textura.rect(i,j,10,10);
    //  } 
    //}
    //textura.endDraw();
    
    textura.beginDraw();
    textura.image(gato,0,random(-300,0));
    textura.endDraw();
    textura.mask(mancha);
    image(textura,x,y);
  }
}

PImage gato;
ArrayList <Palabra> palabras;
String [] poema;
void setup(){
  size(450,450);
  gato = loadImage("gatocubrebocas.png");
  poema = loadStrings("piedradesol.txt");
  println(poema[1]);
  String [] lasFuentes = PFont.list();
  float py = 50;
  palabras = new ArrayList <Palabra>();
  for(int i = 0; i<10; i++){
    Palabra una;
    int vF= round(random(lasFuentes.length));
    int tam = round(random(20,100));
    una = new Palabra(poema[i],tam,0,py,createFont(lasFuentes[vF],tam));
    py+=tam;
    palabras.add(una);
  }
}

void draw(){
  background(255);
  for(Palabra p:palabras){
    p.display();
  }  
}
