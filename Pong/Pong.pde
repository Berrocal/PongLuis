boolean gameStart = false;


// variables pelota
float bolaPosx = 150;
float bolaPosy = 150;
float velx = random(5, 10);
float vely = random(5, 10);
float diam=30;
float radio=15;


// variable raqueta
float raqPosx = 0;
float raqPosy = 0;
int raqLargo = 150;
int raqAncho = 10;

void setup() {

  // tamaño pantalla
  size(500, 500);
  raqPosy = height -30;
}


void draw() {

  // color del fondo
  background (125);

  // Pelota coordenadas y color
  ellipse (bolaPosx, bolaPosy, diam, diam);
  fill(255, 255, 255);

  // Recta de la raqueta
  rectMode(CENTER);  // Set rectMode to CENTER
  rect(mouseX, height-30, raqLargo, raqAncho);


  if (gameStart) {

    // Incremento de posición mediante velocidad en X e Y
    bolaPosx = bolaPosx + velx;
    bolaPosy = bolaPosy + vely;


    // Si pelota toca la raqueta, cambiar dirección de Y
    if ( bolaPosy > raqPosy-radio && bolaPosy < raqPosy+radio) {
      if (bolaPosx > mouseX-raqLargo/2 && bolaPosx < mouseX+raqLargo/2 ) {
        vely = vely * -1;
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
    }
  }
}

// Si se presiona el ratón, comienza el juego
void mousePressed() {
  gameStart = !gameStart;
}
