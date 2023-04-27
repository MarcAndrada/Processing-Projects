// Una primera clase para simular particulas
// Zona de variables y objetos
particula[] sistema_particulas;
int numero_particulas;

// Zona Setup
void setup() {
  // Variables del setup
  float[] p = new float[2];
  float[] v = new float[2];
  // Ventana
  size(500, 500);
  // Reservar memoria para el sistema (array)
  numero_particulas = 1000;
  sistema_particulas = new particula[numero_particulas];
  // Llamamos al constructor
  // de las particulas
  for (int i=0; i<numero_particulas; i++) {
    p[0]=width/2.0;
    p[1]=height/2.0;
    v[0]=random(-50.0, 50.0);
    v[1]=random(-50.0, 0.0);
    sistema_particulas[i] =
      new particula(color(random(255), random(255), random(255)),
      random(5.0, 35.0), random(0.25, 3.0), p, v);
  }
}

// Zona Draw
void draw() {
  background(0);
  // Recorremos las N particulas
  for (int i=0; i<numero_particulas; i++) {
    if (sistema_particulas[i].viva_p) {
      // Calcular
      sistema_particulas[i].calcula_p();
      // Pintar
      sistema_particulas[i].pinta_p();
      // Valorar si sigue viva
      if ((sistema_particulas[i].posicion_p[0]<0.0) // izq.
        ||(sistema_particulas[i].posicion_p[0]>width) // dra.
        ||(sistema_particulas[i].posicion_p[1]<0.0) // arriba
        ||(sistema_particulas[i].posicion_p[1]>height)) // abajo
        sistema_particulas[i].viva_p = false;
    }
  }
}

// Zona para la clase
class particula {
  // Atributos
  color color_p;
  float tamanyo_p;
  float masa_p;
  float kd; // Constante de rozamiento o Damping
  boolean viva_p;
  float[] posicion_p = new float[2];
  float[] velocidad_p = new float[2];
  float[] aceleracion_p = new float[2];
  // Constructor
  particula(color c, float t, float m,
    float[] p, float[] v) {
    color_p = c;
    tamanyo_p = t;
    masa_p = m;
    kd = 0.05;
    viva_p = true;
    posicion_p[0] = p[0];
    posicion_p[1] = p[1];
    velocidad_p[0] = v[0];
    velocidad_p[1] = v[1];
    aceleracion_p[0] = 0.0;
    aceleracion_p[1] = 0.0;
  }
  // Métodos (funciones)
  void pinta_p() { // Pintar la particula
    fill(color_p);
    ellipse(posicion_p[0], posicion_p[1],
      tamanyo_p, tamanyo_p);
  }

  void calcula_p() { // Mover la particula (solver)
    // Solver Euler
    // 1- sumar todas las fuerzas
    // 2- aceleracion = fuerzas/masa
    // 3- velocidad nueva = vel antigua + acel * tiempo
    // 4- posicion nueva = pos antigua + vel * tiempo
    float[] fuerza = new float[2];
    float deltaT = 0.04;
    // 1
    // Gravedad
    fuerza[0]=0.0;
    fuerza[1]=9.8;
    // Rozamiento
    fuerza[0]+=-kd*velocidad_p[0];
    fuerza[1]+=-kd*velocidad_p[1];
    // 2
    aceleracion_p[0]=fuerza[0]/masa_p;
    aceleracion_p[1]=fuerza[1]/masa_p;
    // 3
    velocidad_p[0]=velocidad_p[0]+aceleracion_p[0]*deltaT;
    velocidad_p[1]=velocidad_p[1]+aceleracion_p[1]*deltaT;
    // 4
    posicion_p[0]=posicion_p[0]+velocidad_p[0]*deltaT;
    posicion_p[1]=posicion_p[1]+velocidad_p[1]*deltaT;
  }
}
