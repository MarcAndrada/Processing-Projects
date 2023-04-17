// UN GENERADOR DE INTENCIONES

// ZONA DE VARIABLES Y OBJETOS

// LOS AVATARES
int numero_avatares = 7;
particula[] particulaArray = new particula[numero_avatares];
// DELTA TIEMPO
float inc_t;
// El destino
PVector pos_destino;

// ZONA DE FUNCIONES

void pintar_destino() {
  // Pinta un cuadrado centrado en el destino
  strokeWeight(3);
  noFill();
  stroke(255,0,255);
  rectMode(CENTER);
  rect(pos_destino.x,pos_destino.y,60.0,60.0);
}

PVector calcula_vector_unitario(PVector inicio, PVector fin) {
  PVector vector_calculado;
  vector_calculado = new PVector();
  // 1- Restar posiciones = coords vector entre ambas
  // 2- Hay que restar en el orden adecuado
  vector_calculado.x = fin.x - inicio.x;
  vector_calculado.y = fin.y - inicio.y;
  // 3- Módulo = raiz cuadrada suma componentes al cuadrado
  float modulo = sqrt(vector_calculado.x*vector_calculado.x
  +vector_calculado.y*vector_calculado.y);
  // 4- Vector unitario = Vector/modulo
  vector_calculado.x /= modulo;
  vector_calculado.y /= modulo;
  
  return vector_calculado;
}

PVector dime_centro_bandada() {
  PVector vector_calculado;
  vector_calculado = new PVector(0.0, 0.0, 0.0);
  
  // Centro bandada = promedio posiciones de todxs
  for(int i=0;i<numero_avatares;i++){
    vector_calculado.x += particulaArray[i].pos.x;
    vector_calculado.y += particulaArray[i].pos.y; 
  }
  
  vector_calculado.x /= numero_avatares;
  vector_calculado.y /= numero_avatares; 
  
  return vector_calculado;
}

// ZONA DE CLASES
class particula {
  // ATRIBUTOS
  PVector pos, vel;
  // KB de acercamiento a la bandada
  // KM de acercamiento a la meta
  float masa, tamanyo, KB, KD;
  color color_p;

  // CONSTRUCTOR
  particula(PVector p, PVector v, float m,
    float t, color c) {
    pos = p;
    vel = v;
    masa = m;
    tamanyo = t;
    color_p = c;
    // FISICAMENTE CORRECTO IMPLICA QUE LA SUMA DE LAS K'S DA 1
    KB = 0.1; // SEGUIR A LA BANDADA
    KD = 0.9; // IR A DESTINO
  }
  // MÉTODOS
  void muevete() {  // El SOLVER!!! empleamos un EULER :)
    // 1- Fuerza y la Aceleracion
    PVector fuerza, acel, vector_destino, vector_bandada;
    fuerza = new PVector(0.0, 0.0, 0.0);
    acel = new PVector(0.0, 0.0, 0.0);
    vector_destino = new PVector(0.0, 0.0, 0.0);
    vector_bandada = new PVector(0.0, 0.0, 0.0);

    // Vector al destino
    vector_destino =
    calcula_vector_unitario(pos, pos_destino);
    
    // Vector al centro de la bandada
    vector_bandada =
    calcula_vector_unitario(pos, dime_centro_bandada());

    // MEDIA PONDERADA
    fuerza.x = KD*vector_destino.x
    + KB*vector_bandada.x;
    fuerza.y = KD*vector_destino.y
    + KB*vector_bandada.y;

    // De fuerza a aceleración
    // NEWTON Suma Fuerzas = Masa x Aceleracion
    acel.x = fuerza.x/masa;
    acel.y = fuerza.y/masa;

    // 2- Velocidad
    vel.x = vel.x + acel.x * inc_t;
    vel.y = vel.y + acel.y * inc_t;

    // 3- Posicion
    pos.x = pos.x + vel.x * inc_t;
    pos.y = pos.y + vel.y * inc_t;
  }

  void pintate() {  // ME DIBUJO
    strokeWeight(2);
    noFill();
    stroke(color_p);
    ellipse(pos.x, pos.y, tamanyo, tamanyo);
  }
}

// ZONA DE SETUP
void setup() {
  // Ventana
  size(800, 600);
  // Llamo a los constructores
  // de los avatares (particulas)
  // La bandada
  particulaArray[0] = new particula(
  new PVector(10.0,10.0), new PVector(0.0,0.0),
  1.0,30.0,color(random(255)));
  particulaArray[1] = new particula(
  new PVector(50.0,50.0), new PVector(0.0,0.0),
  1.0,30.0,color(random(255)));
  particulaArray[2] = new particula(
  new PVector(150.0,100.0), new PVector(0.0,0.0),
  1.0,30.0,color(random(255)));
  particulaArray[3] = new particula(
  new PVector(300.0,200.0), new PVector(0.0,0.0),
  1.0,30.0,color(random(255)));
  particulaArray[4] = new particula(
  new PVector(50.0,400.0), new PVector(0.0,0.0),
  1.0,30.0,color(random(255)));
  particulaArray[5] = new particula(
  new PVector(300.0,20.0), new PVector(0.0,0.0),
  1.0,30.0,color(random(255)));
  // La que se mueve
  particulaArray[6] = new particula(
  new PVector(700.0,100.0), new PVector(0.0,0.0),
  1.0,30.0,color(255,0,0));
  // Inicializar ciertos valores
  pos_destino = new PVector(width/2, height/2, 0.0);
  inc_t = 0.04;
}

// ZONA DE DRAW
void draw() {
  // Fondo negro
  background(0);
  // Render de la escena
  pintar_destino();
  // Calcular nuevas posiciones primero
  // para pintar después
  for (int i=0; i<numero_avatares; i++) {
    // Mover
    if (i==6) particulaArray[i].muevete();
    // Dibujar
    particulaArray[i].pintate();
  }
}
