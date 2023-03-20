

float earthAngle, moonAngle, marsAngle;
float earthDistance, moonDistance, marsDistance;
float earthDelta, moonDelta, marsDelta;

void setup()
{
  size(500, 500);
  earthAngle = 0;
  moonAngle = 0;
  marsAngle = 0;
  earthDistance = 100;
  moonDistance = 50;
  marsDistance = 220;
  earthDelta = 0.5f;
  moonDelta = 2;
  marsDelta = 0.3f;
}

void draw()
{
  background(0);

  earthAngle += earthDelta;
  moonAngle += moonDelta;
  marsAngle += marsDelta;

  if (earthAngle >= 360) {
    earthAngle -= 360;
  }
  if  (moonAngle >= 360) {
    moonAngle -= 360;
  }
  if (marsAngle >= 360) {
    marsAngle -= 360;
  }

  DrawSolarSystem();
}


void DrawSolarSystem()
{
  translate(width/2.0, height/2.0); //Desplaza el punto de pivote
  fill(255, 255, 0);
  ellipse(0, 0, 80, 80); //Dibuja el sol

  pushMatrix();
  pushMatrix();
  rotate(radians(earthAngle));
  translate(earthDistance, 0);
  fill(0, 0, 255);
  ellipse(0, 0, 30, 30);
  pushMatrix();
  rotate(radians(moonAngle));
  translate(moonDistance, 0);
  fill(255, 255, 255);
  ellipse(0, 0, 15, 15);

  popMatrix();

  rotate(radians(moonAngle));
  translate(0, moonDistance);
  fill(0, 255, 0);
  ellipse(0, 0, 15, 15);

  popMatrix();

  rotate(radians(marsAngle));
  translate(marsDistance, 0);
  fill(255, 0, 0);
  ellipse(0, 0, 35, 35);

  rotate(radians(moonAngle));
  translate(moonDistance, 0);
  fill(255, 255, 255);
  ellipse(0, 0, 15, 15);

  popMatrix();

  rotate(radians(marsAngle));
  translate(0, 250);
  fill(0, 255, 0);
  ellipse(0, 0, 35, 35);
}
