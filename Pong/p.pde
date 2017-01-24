

//Variables juego
boolean gameStart = false;
int puntos = 0;
int vidas = 3;

// variables pelota
float bolaPosx = 150;
float bolaPosy = 150;
float velx = random(3, 5);
float vely = random(3, 5);
float radio = 15 ;

// variable raqueta
float raqPosx = 0;
float raqPosy = 0;
int raqLargo = 150;
int raqAncho = 10;

// variable raqueta 2
float raq2Posx = 0;
float raq2Posy = 0;
int raq2Largo = 150;
int raq2Ancho = 10;


void setup() {

  size(500, 500);    // tamaño pantalla
  raqPosy = height -30;
  raq2Posy = height -470;
}


void draw() {


  raqPosx = mouseX;
  
  
  if (keyPressed) {
    if (key == 'a' || key == 'a') {
     raq2Posx = raq2Posx + 1;
      }
      }

  // color del fondo
  background (125);

  // Pelota coordenadas y color
  fill(255, 255, 255);
  ellipse (bolaPosx, bolaPosy, radio*2, radio*2);

  // Recta de la raqueta
  rectMode(CENTER);  // Set rectMode to CENTER
  rect(raqPosx, raqPosy, raqLargo, raqAncho);

  // Recta de la raqueta 2
  rectMode(CENTER);  // Set rectMode to CENTER
  rect(raq2Posx, raq2Posy, raq2Largo, raq2Ancho);

  if (gameStart) {

    // Incremento de posición mediante velocidad en X e Y
    bolaPosx = bolaPosx + velx;
    bolaPosy = bolaPosy + vely;


    // Si pelota toca la raqueta 1, cambiar dirección de Y
    if ( bolaPosy+radio+raqAncho/2 > raqPosy && bolaPosy+radio < raqPosy) {
      if (bolaPosx > raqPosx-raqLargo/2 && bolaPosx < raqPosx+raqLargo/2 ) {
        vely = vely * -1;
        puntos=puntos+1;
      }
    }

    // ARRIBA
    // Si pelota toca la raqueta 2, cambiar dirección de Y
    if ( bolaPosy-radio< raq2Posy+raq2Ancho/2  && bolaPosy-radio > raq2Posy-raq2Ancho/2) {
      if (bolaPosx > raq2Posx-raq2Largo/2 && bolaPosx < raq2Posx+raq2Largo/2 ) {
        vely = vely * -1;
        puntos=puntos+1;
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
  }
}


// Si se presiona el ratón, comienza el juego
void mousePressed() {
  gameStart = !gameStart;
}


