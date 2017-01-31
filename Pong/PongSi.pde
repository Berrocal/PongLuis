//Luis López Berrocal

//Pong

//Variables juego
boolean gameStart = false;
int puntos1 = 0;
int puntos2 = 0;
int pantalla = 0;
PFont font1;


// variables pelota
float bolaPosx = 150;
float bolaPosy = 150;
float velx = random(3, 5);
float vely = random(3, 5);
float radio = 15 ;
float diamHit;
int rightColor = 128;

// variable raqueta
float raqPosx = 0;
float raqPosy = 0;
int raqLargo = 150;
int raqAncho = 10;

// variable raqueta 2
float raq2Posx = 250;
float raq2Posy = 0;
int raq2Largo = 150;
int raq2Ancho = 10;


void setup() {

  size(500, 500);    // tamaño pantalla
  raqPosy = height -30;
  raq2Posy = height -470;
  
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
    instrucciones();
    break;
   
  case 3: 
    gana1();
    break;
 case 4: 
    gana2();
    break;
  }
}

// Pantallas
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
  
  textFont(font1, 30); 
  fill(255, 255, 255);
  textAlign(RIGHT);
  text("Instrucciones", width-300 , height-20);
}

void instrucciones() { //En este bloque dibujamos el HUD del menu principal
  
  textFont(font1, 20);         // Fuente del texto            
  fill(255, 255, 255);               // Color de Relleno
  textAlign(CENTER);                 // Alineación del texto
  text("El jugador 1 se moverá mediante el ratón", width/2, height/4);   // Texto y coordenadas
 
 textFont(font1, 20);         // Fuente del texto            
  fill(255, 255, 255);               // Color de Relleno
  textAlign(CENTER);                 // Alineación del texto
  text("El jugador 2 se moverá mediante los botones A y D", width/2, height-175);   // Texto y coordenadas
 
 textFont(font1, 30); 
  fill(255, 255, 255);
  textAlign(RIGHT);
  text("Volver", width-300 , height-20);
}

void juego() { //Dibujamos el HUD del juego
  Pong();
}

void gana1() { //Al ganar
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

void gana2() { //Al ganar
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

// Si se presiona el ratón, comienza el juego
void mousePressed() {
  gameStart = !gameStart;
  
    if (mouseY < height/2 + height/6 && mouseY > height/2 && pantalla == 0) {
    pantalla=1; //Si pulsamos el boton del menu entramos al juego
  }
     if (mouseY < height && mouseY > height-40) {
       if(pantalla==0) pantalla = 2;
       else if(pantalla == 2) pantalla = 0;
   
  }

}



void Pong() {

  raqPosx = mouseX;
 
  //Mover mediantes A y B
  
  if (keyPressed) {
    if (key == 'a' || key == 'a') {
     raq2Posx = raq2Posx - 8;
      }
      }

if (keyPressed) {
    if (key == 'd' || key == 'd') {
     raq2Posx = raq2Posx + 8;
      }
      }
      
     
  // color del fondo
  background (125);
  
   // Texto
   
textAlign(RIGHT);
text("Puntos: " + puntos2, width-width/20, height-450);
textAlign(LEFT);
text("Puntos: " + puntos1, width/20, height-50);

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
      }
      
        if (raqLargo < 20) {
         raqLargo = (raqLargo*90)/100 ;
       }
     
     // Efecto de color
      rightColor = 0;
      fill(random(0,128),random(0,128),random(0,128));
      diamHit = random(75,150);
ellipse(bolaPosx, bolaPosy,diamHit,diamHit);
    }

    // ARRIBA
    // Si pelota toca la raqueta 2, cambiar dirección de Y
    if ( bolaPosy-radio< raq2Posy+raq2Ancho/2  && bolaPosy-radio > raq2Posy-raq2Ancho/2) {
      if (bolaPosx > raq2Posx-raq2Largo/2 && bolaPosx < raq2Posx+raq2Largo/2 ) {
        vely = vely * -1; 
      }
        if (raq2Largo < 20) {
         raq2Largo = (raq2Largo*90)/100 ;
       }
     
     // Efecto de color
      rightColor = 0;
      fill(random(0,128),random(0,128),random(0,128));
      diamHit = random(75,150);
ellipse(bolaPosx, bolaPosy,diamHit,diamHit);
    }



    // Si pelota toca la pared izquierda o derecha, cambiar dirección de x
    if (bolaPosx - radio < 0 || bolaPosx + radio > 500) {
      velx = velx * -1.01;
      bolaPosx = bolaPosx + velx;
    }

  
    //  Si pelota toca la pared de abajo o la de arriba , parar el juego y asignar nuevos valores a las velocidades de X e Y

    if (bolaPosy > height) {
      gameStart = false;
      bolaPosx = 150;
      bolaPosy = 150;
      velx = random(3, 5);
      vely = random(3, 5);
      puntos2 = puntos2 + 1;
    }
    
    if (bolaPosy < 0) { 
      gameStart = false;
      bolaPosx = 150;
      bolaPosy = 150;
      velx = random(3, 5);
      vely = random(3, 5);
      puntos1 = puntos1 + 1;
    }

}
// Si gana jugador 1
 if (puntos1==8) {
    
pantalla=3;
}
// Si gana jugador 2
 if (puntos2==8) {
    
pantalla=4;
}

}
