// MI PRIMERA LUT
// LE METEREMOS UN FILTRO A UN TOMATE DE MIERDA

PImage tomaticoFresco;
PImage tomateNazi;
PImage tomateComunista;


void setup()
{
  //Cargar imagen
  tomaticoFresco = loadImage("tomaquet.jpg");
  tomateNazi = loadImage("tomaquet.jpg");
  tomateComunista = loadImage("tomaquet.jpg");
  //La imagen tiene una resolucion de 400x346
  size(1200, 346);
}



void draw()
{
    //Imagen original
    image(tomaticoFresco,0,0);

    //Imagen retocada 
    //Hacemos LUTs

    for (int i = 0; i < tomateNazi.width; ++i) 
    {
        for(int j = 0; j < tomateNazi.height; ++j)  
        {
            //Pillamos el pixel de la imagen original para que en la siguiente vuelta del bucle no nos pille un pixel modificado
            color colorPixel = tomaticoFresco.get(i,j);
            float red = red(colorPixel);
            float green = green(colorPixel);
            float blue = blue(colorPixel);
            //color newPixelColor = color(0,green,0);
            //color newPixelColor = color(0,255 - green,0);
            //newPixelColor = color((255 - 0.299 * red) , (255 - 0.587 * green) , (255 - 0.114 * blue)); Esto da un azul raro


            float averageColor;
            color newPixelColor;

            //LUT 1 (Hacemos bien los grises)
            averageColor = 0.299 * red + 0.587 * green + 0.114 * blue;
            newPixelColor = color(averageColor,averageColor,averageColor);
            tomateNazi.set(i, j, newPixelColor);

            //LUT 2 (Blanco y negro)
            averageColor = 0.299 * red + 0.587 * green + 0.114 * blue;
            if (averageColor >= 255/2) {
                averageColor = 255;
            }else {
                averageColor = 0;
            }
            newPixelColor = color(averageColor,averageColor,averageColor);
            tomateComunista.set(i, j, newPixelColor);

            

        }

    }
    image(tomateNazi, tomaticoFresco.width, 0);
    image(tomateComunista, tomaticoFresco.width * 2, 0);

   


}
