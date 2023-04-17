// Un 1er sistema de particulas
// Solver Euler
// Se trata de 1 particula que sube y luego cae
// Variables
PVector posicion, velocidad, aceleracion, fuerza, ultimaPos;
float deltaT, masa;
// Setup
void setup(){
  size(800,600);
  // Inicializar la particula
  // Posicion inicial, velocidad inicial, masa...
  posicion = new PVector(width/2.0,height/2.0); // S.I. son m
  velocidad = new PVector(10.0,-50.0); // S.I. son m/s
  aceleracion = new PVector(0.0,0.0); // S.I. son m/s2
  fuerza = new PVector(0.0,0.0); // S.I. son N;
  ultimaPos = posicion;
  masa = 1.0; // Unidades S.I. osea kg
  // Inicializar los parámetros de simulación
  deltaT = 0.04; // Unidades S.I. osea segundos
}

// Draw
void draw(){
  background(0);
  // Calcular
  solverVerlet();
  // Pintar
  fill(0,255,0);
  ellipse(posicion.x,posicion.y,masa*25.0,masa*25.0);
}

// Funciones
void solverVerlet(){

  // 0) Limpiar y dar valores a la fuerza
  // 1) Aceleración = Fuerza / Masa
  // 2) Nueva velocidad = Velocidad ant + Aceleración * Dt
  // 3) Nueva posición = Posición ant + Velocidad ant * Dt
  fuerza.x=0.0; // Imprescindible!!!
  fuerza.y=0.0; // Super importante!!!
  fuerza.x=0.0; // De momento sólo gravedad
  fuerza.y=0.8f; // De momento sólo gravedad
  aceleracion.x=fuerza.x/masa;
  aceleracion.y=fuerza.y/masa;
  
  PVector _lastPos = new PVector(0,0);
  _lastPos = posicion;
  //Hacemos la formula del solver de verlet que es, posicion = posicion*2 - ultimaPos + aceleracion * (delta * 2 (delta al cuadrado)) 
  posicion = new PVector(posicion.x * 2 - ultimaPos.x + aceleracion.x * (deltaT * 2) // Esta es la X
                        , posicion.y * 2 - ultimaPos.y + aceleracion.y * (deltaT * 2)); // Esta la Y
  ultimaPos = _lastPos;

}
