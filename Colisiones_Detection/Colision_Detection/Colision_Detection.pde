

PVector[] cajas;
int altoCaja = 15,anchoCaja = 30;


void setup()
{
  size(400,400);

  cajas = new PVector[10];
  for(int i = 0; i<10; i++)
  {
	cajas[i] = new PVector (random( anchoCaja, width - anchoCaja),random( altoCaja, height - altoCaja)) ;
  }
  
}


void draw()
{
  background(255);
  
  //Ponemos que el rectangulo que creamos empieze en el punto del medio
  rectMode(CENTER);

  fill(255,0,0);

  for(int i = 0; i<10; i++)
  {
	rect(cajas[i].x, cajas[i].y, anchoCaja, altoCaja);
  }
  
   fill(0,0,255);

   rect(mouseX, mouseY, anchoCaja, altoCaja);



}


void mouseMoved()
{
    
  
}


  
