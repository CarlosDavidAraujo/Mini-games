import controlP5.*; //<>//
ControlP5 cp5;

int nivelMuro, vida, pontos, xBesouro, xPersonagem, contador1, contador2, estado;
ArrayList<toca> Tocas;
ArrayList<jarro> Jarros;
ArrayList<aranha> Aranhas;
ArrayList<aranha> Batidos;
boolean cortaMuro, ganhaVida;

void setup() {
  size(900, 600);
  textSize(40);
  noStroke();
  colorMode(HSB, 360, 100, 100);
  cp5 = new ControlP5(this);
  PFont p = createFont("Verdana", 20); 
  ControlFont font = new ControlFont(p);
  cp5.setFont(font);
  botoes();
  estado = 0;
  configInicial();
}

void configInicial() {
  vida = 4;
  pontos = 0;
  nivelMuro = 0;
  xBesouro = -10;
  xPersonagem = width/2;
  contador1 = 0;
  contador2 = 0;
  cortaMuro = true;
  ganhaVida = true;
  Tocas = new ArrayList<toca>();
  Jarros = new ArrayList<jarro>();
  Aranhas = new ArrayList<aranha>();
  for (int i = 0; i < 6; i++) {
    Tocas.add(new toca(i*90+200, 190));
    Jarros.add(new jarro(i*90+200, 130));
  }
}

void draw() { 
  background(200, 50, 100);
  cenario();
  MEF();
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
    target3 = new PVector(indice*90+200, 470);
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
      target = Tocas.get(indice).pos;
    if (pos.y <= 190 + nivelMuro) {
      Aranhas.remove(this);
      vida = vida - 1;
    }
  }
  void bateu(jarro j) {   
    float dist = ((pos.y - r) - (j.pos.y +nivelMuro + j.l)); 
    if (dist <= 0 && pos.x + r >= j.pos.x && pos.x - r <= j.pos.x + j.l)
      Batidos.add(this);
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
  if (pontos%100 == 0 && pontos != 0) {
    if (cortaMuro == true) {        
      xBesouro = xBesouro + 5;
      if (xBesouro >= width) {
        xBesouro = -10;
        nivelMuro = nivelMuro + 60;
        cortaMuro = false;
      }
    }
  } else 
  cortaMuro = true;
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

void criaAranha() {
  if (contador1 >= 100) {
    Aranhas.add(new aranha(245, 600));
    contador1 = 0;
  } else
    contador1 = contador1 + 1;    
  if (contador2 >= 220) {
    Aranhas.add(new aranha(245, 600));
    contador2 = 0;
  } else
    contador2 = contador2 + 1; 

  for (int i = Aranhas.size()-1; i >= 0; i--) {
    aranha v = Aranhas.get(i);
    v.desenha();
  }

  if (xBesouro > -10) {
    for (int i = Aranhas.size()-1; i >= 0; i--) {
      aranha v = Aranhas.get(i);
      Aranhas.remove(v);
    }
  }
} 

void instrucoes() {
  textSize(20);
  fill(0, 0, 100);
  String s = "Use as setas para mover o personagem para os lados";
  String t = "e shift para atirar um jarro quando estiver de frente para um.";
  text(s, width/2 - textWidth(s)/2, 200);
  text(t, width/2 - textWidth(t)/2, 220);
  textSize(40);
}

void rodaJogo() {
  Batidos = new ArrayList<aranha>();
  mostraPontosVida();
  personagem(xPersonagem);
  besouro();
  for (int i = Tocas.size()-1; i >= 0; i--) {
    toca v = Tocas.get(i);
    v.desenha();
  }
  for (int i = Jarros.size()-1; i >= 0; i--) {
    jarro v = Jarros.get(i);
    v.desenha();
  }
  criaAranha();
  for (int i = Aranhas.size()-1; i >= 0; i--) {
    for (int j = Jarros.size()-1; j >= 0; j--) {
      aranha v = Aranhas.get(i);
      jarro b = Jarros.get(j);
      v.bateu(b);
    }
  }
  for (int i = Batidos.size()-1; i >= 0; i--) {
    aranha v = Batidos.get(i);
    Aranhas.remove(v);
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


void telaFinal() {
  fill(0, 0, 0);
  String s = "Parabéns!!! Você venceu!";
  String t = "Game Over";
  String u = "Você obteve "+ pontos + " pontos";
  if (pontos >= 400)
    text(s, width/2 - textWidth(s)/2, 100);
  else {
    text(t, width/2 - textWidth(t)/2, 50);
    text(u, width/2 - textWidth(u)/2, 100);
  }
}

void botoes() {
  int cor = color(0, 0, 0);
  int corMouseOver =  color (100, 100, 50);

  cp5.addButton("iniciar")
    .setPosition(width/2-50, 200)
    .setSize(100, 50)
    .setColorBackground(cor)
    .setColorForeground(corMouseOver)
    ;

  cp5.addButton("tutorial")
    .setPosition(width/2-60, 275)
    .setSize(120, 50)
    .setColorBackground(cor)
    .setColorForeground(corMouseOver)
    ;

  cp5.addButton("menu")
    .setPosition(width/2-50, 275)
    .setSize(100, 50)
    .setColorBackground(cor)
    .setColorForeground(corMouseOver)
    ;
}

void iniciar() {
  estado = 2;
}

void tutorial() {
  estado = 1;
}

void menu() { 
  estado = 0;
}

void MEF() {
  if (estado == 0) {
    background(0, 0, 0);
    configInicial();
    cp5.getController("iniciar").show(); 
    cp5.getController("tutorial").show();
    cp5.getController("menu").hide();
  } else if (estado == 1) { 
    background(0, 0, 0);
    instrucoes(); 
    cp5.getController("iniciar").hide();
    cp5.getController("tutorial").hide();
    cp5.getController("menu").show();
  } else if (estado == 2) {
    rodaJogo();
    cp5.getController("iniciar").hide();
    cp5.getController("tutorial").hide();
    cp5.getController("menu").hide();
  } 
  if (vida <= 0 || pontos >= 400) {
    estado = 3;
    telaFinal();
    cp5.getController("menu").show();
  }
}
