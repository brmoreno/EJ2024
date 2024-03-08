class Juego{
  int vidas;
  int nivel;
  Nivel n;
  int estado ; // 0: inicio, 1: juego, 2:gané, 3:Perdí, 4: terminé niveles, 5: gameover

  Juego(){
    vidas = 3;
    nivel = 1;
    estado = 0;
    ArrayList <Enemigo> enemigos = new ArrayList <Enemigo> ();
    enemigos.add(new Enemigo(100,100,100,1));
    n = new Nivel(2,500,500,enemigos);
  }

  void display(){
    switch(estado){
      case 0:
        inicio();
      break;
      case 1:
        juego();
      break;
      case 2:
        gane();
      break;
      case 3:
        perdi();
      break;
      case 4:
        termineniveles();
      break;
      case 5:
        terminevidas();
      break;
    }
    println("vidas: " + vidas + "  nivel: " + nivel);
  }
  
  
  
  void inicio(){
    background(0,0,255);
  }
  
  void juego(){
    background(255);
    n.display();
    n.update();
    if(n.estado() == 1){
      nivel++;
      
      estado = 2;
      if(nivel == 4){
        estado = 4;
      }
    }
    if(n.estado() == 2){
      vidas--;
      
      estado = 3;
      if(vidas < 0){
        estado = 5;
      }
    }
  }
  
  void gane(){
    background(0,255,0);
  }
  
  void perdi(){
    background(255,0,0);
  }
  
  void termineniveles(){
    background(255);
  }
  
  void terminevidas(){
    background(0);
  }
  
  
  void enKeyPressed(){
    ArrayList <Enemigo> enemigos = new ArrayList <Enemigo> ();
    if(key == 'n'){
      switch(estado){
        case 0:
          estado = 1;
        break;
        case 2:
          estado = 1;
          n = generaNivel();
        break;
        case 3:
          estado = 1;
          n = generaNivel();
        break;
        case 4:
          estado = 0;
          vidas = 3;
          nivel = 1;
          enemigos.add(new Enemigo(100,100,100,1));
          n = new Nivel(1,500,500,enemigos);
        break;
        case 5:
          estado = 0;
          vidas = 3;
          nivel = 1;
          enemigos.add(new Enemigo(100,100,100,1));
          n = new Nivel(1,500,500,enemigos);
        break;
      }
    }
  }
  
  
  Nivel generaNivel(){
    Nivel n_ = null;
   ArrayList <Enemigo> enemigos = new ArrayList <Enemigo> ();
    switch(nivel){
      case 1:
        enemigos.add(new Enemigo(100,100,100,1));
        n_ = new Nivel(2,500,500,enemigos);
      break;
      case 2:
        enemigos.add(new Enemigo(100,100,100,1));
        enemigos.add(new Enemigo(100,500,100,2));
         n_ = new Nivel(2,500,500,enemigos);
      break;
      case 3:
        enemigos.add(new Enemigo(100,100,100,1));
        enemigos.add(new Enemigo(100,500,100,2));
        enemigos.add(new Enemigo(500,100,100,2));
         n_ = new Nivel(2,500,500,enemigos);
      break;
    }
    return n_;
  }
  
}
