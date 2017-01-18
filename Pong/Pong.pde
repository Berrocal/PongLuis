float diamHit;
int rightColor = 128;


//Variables juego
boolean gameStart = false;
int puntos = 0;
int vidas = 3;
int pantalla = 0;
PFont font1;

// variables pelota
float bolaPosx = 150;
float bolaPosy = 150;
float velx = random(5, 10);
float vely = random(5, 10);
float diam = 30;
float radio = diam/2 ;


// variable raqueta
float raqPosx = 0;
float raqPosy = 0;
int raqLargo = 150;
int raqAncho = 10;


void setup() {

  // tamaño pantalla
  size(500, 500);
  raqPosy = height -30;
  
  font1 = createFont("Arial", 16, true); //Creamos una fuente para las letras
}


void draw() {
  background(125); //Limpiamos la pantalla
  switch (pantalla) { //Dibujamos una cosa u otra dependiendo del estado del juego
  case 0: 
    menu();
    break;

  case 1: 
    juego();
    break;

  case 2: 
    perder();
    break;
    
  case 3: 
    ganar();
    break;


  }
}

void menu() { //En este bloque dibujamos el HUD del menu principal
  
  textFont(font1, height/6);         // Fuente del texto            
  fill(255, 255, 255);               // Color de Relleno
  textAlign(CENTER);                 // Alineación del texto
  text("PONG", width/2, height/4);   // Texto y coordenadas
 
  fill(255, 255, 255);               
  rect(0, height/2, width, height/6);
  
  textFont(font1, height/6); 
  fill(random(0, 255),random(0, 255),random(0, 255));
  text("PLAY", width/2, height/2 + height/6 - height/40);
  
  textFont(font1, 16); 
  fill(255, 255, 255);
  textAlign(RIGHT);
  text("Luis López Berrocal", width-25 , height-20);
}

void juego() { //Dibujamos el HUD del juego
  Pong();
}

void perder() { //Al perder
  textFont(font1, height/6);    
  
  float x1 = map(mouseX, 0, 500, 0, 250);
  float x2 = map(mouseY, 0, 500, 0, 250);
  
  fill(x1, x2, (x1+x2)/2);
  textAlign(CENTER);
  text("Final", width/2, height/4);   
  textFont(font1, height/6); 
  text("del Juego ", width/2, height/2);   
   
  fill((x1+x2)/2, x1, x2);
  text("Puntos: " + puntos, width/2, height - height/8);
}

void ganar() { //Al ganar
  textFont(font1, height/6);    
  
  float x1 = map(mouseX, 0, 500, 0, 250);
  float x2 = map(mouseY, 0, 500, 0, 250);
  
  fill(x1, x2, (x1+x2)/2);
  textAlign(CENTER);
  text("Has", width/2, height/4);   
  textFont(font1, height/6); 
  text("ganado", width/2, height/2);   
   
  fill((x1+x2)/2, x1, x2);
  text("¡FELICIDADES!", width/2, height - height/8);
}

void mouseClicked() { //Al pulsar el raton
  if (mouseY < height/2 + height/6 && mouseY > height/2 && pantalla == 0) {
    pantalla=1; //Si pulsamos el boton del menu entramos al juego
  }
}

void keyPressed() { //CUando pulsamos una tecla
  switch (key) {
  case 'r': 
    if (pantalla == 1 || pantalla == 2) Pong(); //Para reiniciar la partida en el juego o una vez hayamos perdido
    puntos = 0;
    vidas = 3;
    pantalla = 1; 
    break;
  case 'c':
    exit(); //Para salir del juego
    break;

  case 'p': 
    if (pantalla == 1) pantalla = 3; //Para pausar el juego
    else if (pantalla  == 3) pantalla = 1;
  }
}

void Pong() {

  // color del fondo
  background (125);

  // Pelota coordenadas y color
  ellipse (bolaPosx, bolaPosy, diam, diam);
  fill(255, 255, 255);

  // Recta de la raqueta
  rectMode(CENTER);  // Set rectMode to CENTER
  rect(mouseX, height-30, raqLargo, raqAncho);
  
  // Texto
  textAlign(RIGHT);
text(vidas + " VIDAS", width-width/20, height/20);
textAlign(LEFT);
text("PUNTOS: " + puntos, width/20, height/20);

  if (gameStart) {

    // Incremento de posición mediante velocidad en X e Y
    bolaPosx = bolaPosx + velx;
    bolaPosy = bolaPosy + vely;


    // Si pelota toca la raqueta, cambiar dirección de Y
    if ( bolaPosy > raqPosy-radio && bolaPosy < raqPosy+radio) {
      if (bolaPosx > mouseX-raqLargo/2 && bolaPosx < mouseX+raqLargo/2 ) {
        vely = vely * -1;
        puntos=puntos+1;
       if (raqLargo > 12) {
         raqLargo = (raqLargo*90)/100 ;
       }
     
      rightColor = 0;
      fill(random(0,128),random(0,128),random(0,128));
      diamHit = random(75,150);
      ellipse(bolaPosx, bolaPosy,diamHit,diamHit);
      }
    }

    // Si pelota toca la pared izquierda o derecha, cambiar dirección de x
    if (bolaPosx - radio < 0 || bolaPosx + radio > 500) {
      velx = velx * -1.01;
      bolaPosx = bolaPosx + velx;
    }

    //  Si pelota toca la pared de arriba , cambiar dirección de Y
    if ( bolaPosy - radio  < 0 ) {
      vely = vely * -1;
      bolaPosy = bolaPosy + vely;
    }
    //  Si pelota toca la pared de abajo , parar el juego y asignar nuevos valores a las velocidades de X e Y

    if (bolaPosy > height) {
      gameStart = false;
      bolaPosx = 150;
      bolaPosy = 150;
      velx = random(5, 10);
      vely = random(5, 10);
      vidas = vidas - 1;
     
    }
  
    }
      if (vidas==0) {
        textAlign(CENTER);
       text("Final del Juego", width/2, height/2);
       puntos=0;
       pantalla=2;
  }
}


// Si se presiona el ratón, comienza el juego
void mousePressed() {
  gameStart = !gameStart;
}
