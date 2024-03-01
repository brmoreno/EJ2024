class Epiciclo{
  ArrayList <PVector> pvs;
  FloatList dr;
  int n;
  color colores[];
  FloatList al;
  
  Epiciclo(int n_, float m_){
    pvs = new ArrayList<PVector>();
    dr = new FloatList ();
    n = n_;
    for(int i = 0; i<n; i++){
      pvs.add(new PVector(100,0));
      dr.append(((i + 1)*m_)*PI/256);
    }
  }
  
  Epiciclo(int n_){
    pvs = new ArrayList<PVector>();
    dr = new FloatList ();
    n = n_;
    colores = new color[n];
    al = new FloatList();
    for(int i = 0; i<n; i++){
      
      pvs.add(PVector.random2D().mult(random(20,100)));
      dr.append(random(-0.05,0.05));
      colores[i] = color(random(255),random(255),random(255));
      al.append(random(30));
    }
  }
  
  void update(){
    for(int i = 0; i<n; i++){
      pvs.get(i).rotate(dr.get(i));
    }
  }
  
  void display(){
    PVector ini = new PVector(0,0);
    PVector fin = new PVector(0,0);
    for(int i = 0; i<n; i++){
      fin.add(pvs.get(i));
      strokeWeight(al.get(i));
      stroke(colores[i],40);
      
      line(ini.x,ini.y,fin.x,fin.y);
      
      ini = fin.copy();
    }
  }  
}

Epiciclo uno;

void setup(){
  uno = new Epiciclo(8);
 size(600,600);
 background(255);
}

float x;
void draw(){
  x+= 0.5;
  translate(x,height/2);
  uno.display();
  uno.update();
}
