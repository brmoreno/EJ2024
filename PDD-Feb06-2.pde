size(400,400);
IntList lista = new IntList();
for(int i = 0; i<5; i++){
  lista.append(color(random(255),random(255),random(255)));
}

for(int j = 0; j<10; j++){
  for(int i = 0; i<5; i++){
    fill(lista.get(i));
    rect(i*10 +j*50,0,10,400);
  }
  lista.shuffle();
}
