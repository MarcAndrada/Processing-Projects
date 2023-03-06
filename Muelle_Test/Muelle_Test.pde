/* 1 muelle que une a 2 particulas
 Una esta fija. La otra tiene gravedad friccion y el muelle (3 fuerzas)
 NECESITAMOS UN SOLVER
 */


float km, lm; //km = fuerza del muelle , lm = longitud del muelle
PVector anchor;
Particle particle;

void setup()
{
  size(1920, 1080);
  //Inicializamos km y lm
  km = 0.8f;
  lm = 30;
  //El Anclaje
  anchor = new PVector(width/2, height / 4);

  //Inicializar la particula
  PVector starterPos = new PVector(width / 4, height *0.4);
  PVector starterSpeed = new PVector(-30, -20);

  particle = new Particle(starterPos, starterSpeed, 1, 35);
}


void draw() {
  background(0);
  //Calcular
  anchor = new PVector(mouseX, mouseY);
  particle.Calculate();

  particle.DrawParticle();
  //Anclaje Verde
  fill(0, 255, 0);
  ellipse(anchor.x, anchor.y, particle.m_size, particle.m_size);
  //Muelle rojo
  stroke(255, 0, 0);
  line(particle.m_position.x, particle.m_position.y, anchor.x, anchor.y);
}



class Particle
{
  PVector m_position, m_speed;
  float m_mass, m_size, m_kd; // kd = Constante de damping (friccion)

  Particle(PVector _position, PVector _speed, float _mass, float _size)
  {
    m_position = _position;
    m_speed = _speed;
    m_mass = _mass;
    m_size = _size;
    m_kd = 0.4f;
  }

  void Calculate()
  {
    //Solver
    //1-Limpiar las fuerzas
    //2-Calcular / añadir fuerzas
    //3-Calcular aceleracion
    //4-Calcular velocidad
    //5-Calcular posicion
    PVector force = new PVector(0, 0);
    PVector acceleration = new PVector(0, 0);
    float deltaTime = 0.04f;

    //Fuerzas: gravedad , friccion y muelle
    //Gravedad
    force.x = 0;
    force.y = 9.8f;
    //Friccion
    force.x += -m_kd * m_speed.x;
    force.y += -m_kd * m_speed.y;
    //Muelle
    force.x += -km * ((m_position.x - anchor.x)- lm);
    force.y += -km * ((m_position.y - anchor.y)- lm);
    acceleration.x = force.x / m_mass;
    acceleration.y = force.y / m_mass;
    m_speed.x += acceleration.x * deltaTime;
    m_speed.y += acceleration.y * deltaTime;
    m_position.x += m_speed.x * deltaTime;
    m_position.y += m_speed.y * deltaTime;
  }


  void DrawParticle()
  {
    fill(255, 255, 0);
    ellipse(m_position.x, m_position.y, m_size, m_size);
  }
}
