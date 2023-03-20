

void setup()
{
  size(640, 360, P3D); //CON EL P3D LE DECIMOS A PROCESSING QUE ES EN 3D
}


void draw()
{
  background(100);


  translate(width/2, height/2, 0);

  //Definimos la vista isometrica
  rotateX(radians(-35.26));
  rotateY(radians(-45));


  noFill();
  stroke(255);
  strokeWeight(2);
  box(100);

  DrawAxis();
}



void DrawAxis()
{

  strokeWeight(6);
  //X
  stroke(255, 0, 0);
  line(0, 0, 0, 100, 0, 0);
  //Y
  stroke(0, 255, 0);
  line(0, 0, 0, 0, 100, 0);
  //Z
  stroke(0, 0, 255);
  line(0, 0, 0, 0, 0, 100);
}
