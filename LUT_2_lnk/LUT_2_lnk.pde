PImage tomaticoFresco;

void setup()
{
  //Cargar imagen
  tomaticoFresco = loadImage("tomaquet.jpg");

  //La imagen tiene una resolucion de 400x346
  size(400, 346);
    image(tomaticoFresco,0,0);

}
void draw(){ 
    
  color colorPixel = tomaticoFresco.get(mouseX,mouseY);

  noStroke();
  fill(colorPixel);
  ellipse(mouseX, mouseY, 40, 40);
  
}
