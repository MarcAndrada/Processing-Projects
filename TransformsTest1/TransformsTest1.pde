//1ER EJEMPLO DE TRASFORMACIONES





void DrawObject(color _color, float _size)
{
  noStroke();
  fill(_color);
  ellipse(0, 0, _size, _size);
}

void DrawAxis()
{
  stroke(0, 0, 255);
  strokeWeight(3);
  line(0, 0, 100, 0);
  stroke(255, 0, 0);
  line(0, 0, 0, 100);
}



void setup()
{
  size(500, 500);
}

void draw()
{
  background(0);
  //Pintar 1r objeto
  DrawAxis();
  //Me translado al centro de la ventana y pinto el objeto
  //translate(float incX, float incY);
  translate(width/2, height/2);
  DrawObject(color(255, 0, 0), 15);
  DrawAxis();

  //Pintar 2do objeto
  rotate(radians(45));
  DrawAxis();
  translate(50, 25);
  DrawObject(color(0, 255, 0), 35);
  DrawAxis();

  //Pintar 3r objeto
  translate(70,0);
  scale(3);
  DrawObject(color(18,123,98), 15);
  DrawAxis();
  
  
}
