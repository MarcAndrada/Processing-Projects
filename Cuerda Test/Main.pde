int particlesNum = 5;
int springNum = 4;

Particle[] particles = new Particle[particlesNum];
Spring[] springs = new Spring[springNum];
float deltaTime;


void setup()
{
  size(800, 600);

  particles[0] = new Particle(new PVector(width/2 - 200, height/2), new PVector(0, 0), 2f, 30f, 0.8f, color(random(255), random(255), random(255)), true); //Estatica izquierda
  particles[1] = new Particle(new PVector(width/2 - 100, height/2), new PVector(0, 0), 2f, 30f, 0.8f, color(random(255), random(255), random(255)), false); // No estatica
  particles[2] = new Particle(new PVector(width/2, height/2), new PVector(0, 0), 2f, 30f, 0.8f, color(random(255), random(255), random(255)), false); // No estatica
  particles[3] = new Particle(new PVector(width/2 + 100, height/2), new PVector(0, 0), 2f, 30f, 0.8f, color(random(255), random(255), random(255)), false); // No estatica
  particles[4] = new Particle(new PVector(width/2 + 200, height/2), new PVector(0, 0), 2f, 30f, 0.8f, color(random(255), random(255), random(255)), true); // Estatica derecha

  springs[0] = new Spring(new PVector(50, 140), 0.2f, color(random(255), random(255), random(255)));
  springs[1] = new Spring(new PVector(50, 140), 0.2f, color(random(255), random(255), random(255)));
  springs[2] = new Spring(new PVector(50, 140), 0.2f, color(random(255), random(255), random(255)));
  springs[3] = new Spring(new PVector(50, 140), 0.2f, color(random(255), random(255), random(255)));

  deltaTime = 0.04;
}

void draw()
{
  background(0);

  for (int i = 0; i < particlesNum; i++)
  {
    particles[i].force = new PVector();
  }


  for (int i = 0; i < springNum; i++)
  {
      PVector fm;

    fm = springs[0].ApplyForce(particles[i], particles[i + 1]);
    particles[i].force.x += fm.x;
    particles[i].force.y += fm.y;
    particles[i + 1].force.x -= fm.x;
    particles[i + 1].force.y -= fm.y;
  }

  for (int i = 0; i < particlesNum; i++)
  {
    particles[i].Move();
    particles[i].Draw();
  }


  for (int i = 0; i < springNum; i++)
  {
    springs[i].Draw(particles[i], particles[i + 1]);
  }
}
