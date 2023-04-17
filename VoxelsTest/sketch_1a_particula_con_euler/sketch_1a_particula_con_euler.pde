// Un 1er sistema de particulas
// Solver Euler
// Se trata de 1 particula que sube y luego cae
// Variables
PVector posicion;
PVector velocidad;
PVector aceleracion;
PVector ultimaPos;
PVector fuerza;
PVector voxelPos;
float deltaT, masa, particleSize, voxelConstant, voxelSize;
PVector voxelForce;

// Setup
void setup() {
  size(800, 600);
  // Inicializar la particula
  // Posicion inicial, velocidad inicial, masa...
  posicion = new PVector(width/2.0, height/2.0); // S.I. son m
  voxelPos = new PVector(width/2.0 , height/2.0 + 200 );
  velocidad = new PVector(10.0, -50.0); // S.I. son m/s
  aceleracion = new PVector(0.0, 0.0); // S.I. son m/s2
  fuerza = new PVector(0.0, 0.0); // S.I. son N;
  ultimaPos = posicion;
  voxelConstant = 0.1f;
  voxelSize = 60;
  voxelForce = new PVector(0,0);
  masa = 1.0; // Unidades S.I. osea kg
  particleSize = masa*25;
  // Inicializar los parámetros de simulación
  deltaT = 0.04; // Unidades S.I. osea segundos
}

// Draw
void draw() {
  background(0);
  // Calcular
  voxelChecker();
  solverVerlet();
  // Pintar
  rectMode(CENTER);
  noStroke();
  fill(0, 255, 0);
  square(posicion.x, posicion.y, particleSize);

  noFill();
  stroke(255);
  strokeWeight(2);
  square(voxelPos.x, voxelPos.y, voxelSize);


}

// Funciones

void voxelChecker()
{
  if (voxelPos.x - voxelSize <= posicion.x + particleSize && voxelPos.x + voxelSize >= posicion.x - particleSize
    && voxelPos.y - voxelSize <= posicion.y + particleSize && voxelPos.y + voxelSize >= posicion.y - particleSize)
  {
    PVector normalizedVector = UnitaryVector(posicion, voxelPos);
    float force = dist(voxelPos.x, voxelPos.y, posicion.x, posicion.y) - voxelSize;
    voxelForce = new PVector(normalizedVector.x * force, normalizedVector.y * force);
  } 
  else
  {
    voxelForce = new PVector(0, 0);
  }
}

void solverVerlet() {

  // 0) Limpiar y dar valores a la fuerza
  // 1) Aceleración = Fuerza / Masa
  // 2) Nueva velocidad = Velocidad ant + Aceleración * Dt
  // 3) Nueva posición = Posición ant + Velocidad ant * Dt
  fuerza.x=0.0; // Imprescindible!!!
  fuerza.y=0.0; // Super importante!!!
  fuerza.x=0.0 + voxelForce.x * voxelConstant; // De momento sólo gravedad
  fuerza.y=0.8f + voxelForce.y * voxelConstant; // De momento sólo gravedad
  aceleracion.x=fuerza.x/masa;
  aceleracion.y=fuerza.y/masa;

  PVector _lastPos = new PVector(0, 0);
  _lastPos = posicion;
  //Hacemos la formula del solver de verlet que es, posicion = posicion*2 - ultimaPos + aceleracion * (delta * 2 (delta al cuadrado))
  posicion = new PVector(posicion.x * 2 - ultimaPos.x + aceleracion.x * (deltaT * 2) // Esta es la X
    , posicion.y * 2 - ultimaPos.y + aceleracion.y * (deltaT * 2)); // Esta la Y
  ultimaPos = _lastPos;
}

PVector UnitaryVector(PVector start, PVector end)
{
  PVector result = new PVector();

  result.x = end.x - start.x;
  result.y = end.y - start.y;
  result.z = end.z - start.z;

  float mod = sqrt(result.x * result.x + result.y * result.y + result.z * result.z );

  result.x /= mod;
  result.y /= mod;
  result.z /= mod;


  return result;
}
