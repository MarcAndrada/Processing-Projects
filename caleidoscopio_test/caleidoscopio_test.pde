//Caleidoscopio
// OLE OLEE

//Variables

int x1,y1,x2,y2,x3,y3;
int index = 0;


//Funciones

//Setup es un Start solo se llama una vez
void setup()
{
  //Crear la ventana nos pide dos valores de altura y ancho de la pantalla
  size(800, 600);
  
  //Le ponemos un color al background
  background(255,255,255);
  
}


//El draw es el update
void draw()
{
  //Con esto limpiamos la pantalla
  //background(255,255,255);
  //Aqui dibujamos el mouse
  stroke(255,0,0); //Color con el que vamos a dibujar
  //Con esta funcion le definmos el tamaño de lo que vamos a pintar
  strokeWeight(10);
   
  //Dibujamos los puntos
  //point(mouseX, mouseY);
  //point(width - mouseX, mouseY);
  //point(mouseX, height - mouseY);
  //point(width - mouseX, height - mouseY);
  
  
}


//Eventos

void mousePressed()
{
  
  point(mouseX, mouseY);
  point(width - mouseX, mouseY);
  point(mouseX, height - mouseY);
  point(width - mouseX, height - mouseY); 
  
  index++;
  switch(index)
  {
   case 1:
    x1 = mouseX;
    y1 = mouseY;
    break;
   case 2:
    x2 = mouseX;
    y2 = mouseY;  
    break;
    case 3:
    x3 = mouseX;
    y3 = mouseY; 
    DrawTriangles();
    print(x1, " ", y1, " - " ,x2, " ", y2, " - ", x3, " ", y3);
    index = 0; 
    
    break;
   default:
     break;
  }
}



void DrawTriangles()
{
  //Pintar un triangulo en verde con fondo gris
    stroke(0,180,0);
    strokeWeight(5);
    fill(150,150,150);
    
    //Triangulo 1
    beginShape(TRIANGLES);
    vertex(x1,y1);
    vertex(x2,y2);
    vertex(x3,y3);
    endShape();
  
    //Triangulo 2
    beginShape(TRIANGLES);
    vertex(width - x1, y1);
    vertex(width - x2, y2);
    vertex(width - x3, y3);
    endShape();

    //Triangulo 3
    beginShape(TRIANGLES);
    vertex(x1, height - y1);
    vertex(x2, height - y2);
    vertex(x3, height - y3);
    endShape();

    //Triangulo 4
    beginShape(TRIANGLES);
    vertex(width - x1, height - y1);
    vertex(width - x2, height - y2);
    vertex(width - x3, height - y3);
    endShape();

}
