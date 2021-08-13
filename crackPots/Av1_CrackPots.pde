import controlP5.*; //<>// //<>// //<>// //<>// //<>//
ControlP5 cp5;

int nivelMuro, vida, pontos, xBesouro, xPersonagem, contador1, contador2;
ArrayList<toca> tocaArray;
ArrayList<jarro> jarroArray;
ArrayList<aranha> aranhaArray;
ArrayList<aranha> batidoArray;
boolean cortaMuro, ganhaVida;

void setup() {
  size(900, 600);
  textSize(40);
  noStroke();
  colorMode(HSB, 360, 100, 100);
  cp5 = new ControlP5(this);
  vida = 4;
  pontos = 0;
  nivelMuro = 0;
  xBesouro = 0;
  xPersonagem = width/2;
  contador1 = 0;
  contador2 = 0;
  cortaMuro = true;
  ganhaVida = true;
  tocaArray = new ArrayList<toca>();
  jarroArray = new ArrayList<jarro>();
  aranhaArray = new ArrayList<aranha>();
  //batidoArray = new ArrayList<aranha>();
  for (int i = 0; i < 6; i++) {
    tocaArray.add(new toca(i*90+200, 190));
    jarroArray.add(new jarro(i*90+200, 130));
  }
}

void draw() { 
  background(200, 50, 100); 
  cenario();
  if (vida <= 0 || pontos >= 400) telaFimJogo();
  else {
    batidoArray = new ArrayList<aranha>();
    mostraPontosVida();
    personagem(xPersonagem);
    for (int i = tocaArray.size()-1; i >= 0; i--) {
      toca v = tocaArray.get(i);
      v.desenha();
    }
    for (int i = jarroArray.size()-1; i >= 0; i--) {
      jarro v = jarroArray.get(i);
      v.desenha();
    }
    MEF();
    for (int i = aranhaArray.size()-1; i >= 0; i--) {
      for (int j = jarroArray.size()-1; j >= 0; j--) {
        aranha v = aranhaArray.get(i);
        jarro b = jarroArray.get(j);
        v.bateu(b);
      }
    }
    for (int i = batidoArray.size()-1; i >= 0; i--) {
      aranha v = batidoArray.get(i);
      aranhaArray.remove(v);
      pontos = pontos + 10;
    }
    if (pontos%100 == 0 && pontos != 0) {
      if (ganhaVida == true) {
        vida = vida +1;
        ganhaVida = false;
      }
    } else
      ganhaVida = true;
  }
}

void telaFimJogo() {
  fill(0, 0, 0);
  if (pontos >= 400)
    text("Parabéns!!! Você venceu!", 220, 100);
  else {
    text("Game Over", 350, 50);
    text("Você obteve "+ pontos + " pontos", 270, 100);
  }
}
void cenario() {
  fill(0, 0, 70);
  rect(0, nivelMuro+120, width, 40);
  fill(0, 40, 50);
  for (int i = 0; i <10; i++) {
    for (int j = 0; j <10; j++) {
      if (j%2 == 0) {
        stroke(0, 0, 100);
        strokeWeight(2);
        rect(i*100, nivelMuro+j*35+160, 100, 35);
      } else {
        stroke(0, 0, 100);
        strokeWeight(2);
        rect(i*100-50, nivelMuro+j*35+160, 100, 35);
      }
    }
  }
  noStroke();
  fill(0, 0, 80);
  rect(0, 510, width, 20);
  fill(40, 70, 80);
  rect(0, 530, width, 35);
  fill(0, 0, 50);
  rect(0, 565, width, 35);
  fill(0, 100, 20);
  rect(245, 565, 35, 35);
  quad(245, 565, 280, 565, 300, 530, 225, 530);
}

void coracao(int x, int y, int size) {
  fill(0, 100, 100);
  ellipse(x-(size*sqrt(2))/4, y-size/sqrt(8), size, size);
  ellipse(x+(size*sqrt(2))/4, y-size/sqrt(8), size, size);
  quad(x-(size*sqrt(2))/2, y, x, y - (size*sqrt(2))/2, x + (size*sqrt(2))/2, y, x, y +(size*sqrt(2))/2);
}

void mostraPontosVida() {
  fill(50, 100, 100);
  text(pontos, 440, 40);
  fill(0, 80, 80);
  for (int i = 0; i < vida; i++)
    coracao(i*40+20, 20, 20);
}

void besouro() {
  fill(0, 40, 20);
  rect(0, 490, xBesouro, 20);
  fill(65, 70, 60);
  ellipse(xBesouro, 500, 20, 20);
}

void personagem(int x) {
  fill(40, 80, 80);
  ellipse(x, 100 + nivelMuro, 40, 40);
  if (keyPressed) {
    if (keyCode == RIGHT && xPersonagem <= width - 20)
      xPersonagem += 5;
    if (keyCode == LEFT && xPersonagem >= 20)
      xPersonagem -= 5;
  }
}

class toca {
  PVector pos;
  int r;
  toca(float x, float y) {
    pos = new PVector(x, y);
    r = 20;
  }
  void desenha() {
    fill(0, 100, 20);
    ellipse(pos.x+15, pos.y+nivelMuro, 2*r, 2*r);
  }
}

class jarro { 
  PVector pos, vel;
  int l;
  boolean cai;
  jarro (int x, int y) {
    pos = new PVector(x, y);
    vel = new PVector(0, 5);
    l = 30;
    cai = false;
  }
  void desenha() {
    fill(180, 40, 50);
    rect(pos.x, pos.y+nivelMuro, l, l);
    move();
  }
  void move() {
    if (keyPressed)
      if (keyCode == SHIFT && xPersonagem >= pos.x && xPersonagem <= pos.x + l) {
        cai = true;
      }
    if (cai == true) 
      pos = pos.add(vel);   
    if (pos.y + 30 >= 530 - nivelMuro && keyPressed == false) {
      pos.y = 130;
      cai = false;
    }
  }
}

class aranha {
  PVector pos, vel, target, target2, target3;
  int r, indice;
  aranha(int x, int y) {
    pos = new PVector(x, y);
    vel = new PVector(0, -1);
    r = 10;
    indice = (int) random(0, 6);
    target = new PVector(245, 520);  
    target2 = new PVector(indice*90+155, 520);
    target3 = new PVector(indice*90+155+45, 470);
  }
  void desenha() {
    fill(0, 0, 0);
    ellipse(pos.x +15, pos.y, 2*r, 2*r);
    move();
  }
  void move() {
    PVector z = target.copy();
    z.sub(pos);
    if (pos.y == 520) 
      vel = z.setMag(4);
    else
      vel = z.setMag(2);
    pos = pos.add(vel);
    if (pos.y <= target.y)
      target = target2; 
    if (pos.x >= target2.x && pos.y <= target2.y)
      target = target3;
    if (pos.y <= target3.y)
      target = tocaArray.get(indice).pos;
    if (pos.y <= 190 + nivelMuro) {
      aranhaArray.remove(this);
      vida = vida - 1;
    }
  }
  void bateu(jarro j) {   
    float dist = ((this.pos.y - this.r) - (j.pos.y +nivelMuro + j.l)); 
    println(dist);
    if (dist <= 0 && this.pos.x + this.r >= j.pos.x && this.pos.x - this.r <= j.pos.x + j.l)
      batidoArray.add(this);
  }
}

void criaAranha() {
  if (contador1 >= 100) {
    aranhaArray.add(new aranha(245, 600));
    contador1 = 0;
  } else
    contador1 = contador1 +1;    
  if (contador2 >= 220) {
    aranhaArray.add(new aranha(245, 600));
    contador2 = 0;
  } else
    contador2 = contador2 +1; 
  for (int i = aranhaArray.size()-1; i >= 0; i--) {
    aranha v = aranhaArray.get(i);
    v.desenha();
  }
}

void  MEF() {
  if (pontos%100 == 0 && pontos != 0) {
    if (cortaMuro == true) {        
      besouro();
      xBesouro = xBesouro + 5;
      if (xBesouro >= width) {
        xBesouro = 0;
        nivelMuro = nivelMuro + 60;
        cortaMuro = false;
      }
    }
  } else 
  cortaMuro = true;

  if (xBesouro > 0) {
    for (int i = aranhaArray.size()-1; i >= 0; i--) {
      aranha v = aranhaArray.get(i);
      aranhaArray.remove(v);
    }
  } else
    criaAranha();
}

void botaoPlay() {
  int cor = color(100, 100, 80);
  cp5.addButton("play")
    .setValue(128)
    .setPosition(140, 300)
    .setColorBackground(cor)
    .updateSize()
    ;
}
