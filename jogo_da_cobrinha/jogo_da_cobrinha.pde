ArrayList<cobra> Cobra; //<>//
ArrayList<fruta> Fruta;
cobra head;
void setup() {
  size(300, 300);
  rectMode(CENTER);
  Cobra = new ArrayList<cobra>();
  Cobra.add(new cobra(0,0));
  Fruta = new ArrayList<fruta>();
  criaFrutaAleatoria();
  head = Cobra.get(0);
}

void draw() {
  background(0);
  for (int i = 0; i< Cobra.size(); i++) {
    cobra v = Cobra.get(i);
    v.display();
    for (int j = 1; j < Cobra.size(); j++) {
      Cobra.get(j).pos = Cobra.get(j-1).prevPos;
    }
  }
  for (int i=0; i<Fruta.size(); i++) {
    fruta f = Fruta.get(i);
    f.display();
    head.colisaoXfruta(f);
  }
  for (int i=0; i<Cobra.size(); i++) {
    if (i!= 0) {
      cobra v = Cobra.get(i);
      head.colisaoXcobra(v);
    }
  }
}

class cobra {
  PVector pos, tempPos, prevPos;
  int l, count;
  cobra(int x, int y) {
    l = 10;
    count = 0;
    pos = new PVector(x+l/2, y+l/2);
    tempPos = pos.copy();
    prevPos = pos.copy();
  }
  void display() {
    fill(255);
    rect(pos.x, pos.y, l, l);
    fill(255, 0, 0);
    if (tempPos.equals(pos) == false) {
      prevPos = tempPos.copy();
      tempPos = pos.copy();
    }
    move();
  } 
  void move() {
    if (count >= 5) {
      if (keyCode == RIGHT) pos.x += 10;
      else if (keyCode == LEFT) pos.x -= 10;
      else if (keyCode == UP) pos.y -= 10;
      else if (keyCode == DOWN) pos.y += 10;
      if (pos.x>width-l/2) pos.x = l/2;
      if (pos.x<l/2) pos.x = width-l/2;
      if (pos.y>height-l/2) pos.y = l/2;
      if (pos.y<l/2) pos.y = height-l/2;
      count = 0;
    } else count++;
  }
  void colisaoXfruta(fruta f) {
    if (pos.equals(f.pos)) {
      Fruta.remove(f);
      criaFrutaAleatoria();
      Cobra.add(new cobra((int)prevPos.x, (int)prevPos.y));
    }
  }
  void colisaoXcobra(cobra outra) {
    if (pos.equals(outra.pos)) Cobra.remove(outra);
  }
}
class fruta {
  PVector pos;
  int d;
  fruta(int x, int y) {
    d = 10;
    pos = new PVector(x+d/2, y+d/2);
  }
  void display() {
    fill(255, 0, 0);
    ellipse(pos.x, pos.y, d, d);
  }
}

void criaFrutaAleatoria() {
  int i = (int) random(0, width/10);
  int j = (int) random(0, height/10);
  Fruta.add(new fruta(i*10, j*10));
}

void grid() {
  for (int i=0; i<width/10; i++) {
    for (int j=0; j<height/10; j++) {
      fill(150);
      rect(i*10+5, j*10+5, 10, 10);
    }
  }
}
