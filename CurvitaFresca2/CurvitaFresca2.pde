//Vamos a hacer una curva de bezier

Corve[] bezierCorve;



void setup()
{
    size(800, 600);

    bezierCorve = new Corve[1];
    PVector[] points = new PVector[4];

    color corveColor = color(255,255,0);
    int corveThickness = 15;
    int totalPoints = 20;
    
    //Inicializar puntos de curva 1
    points[0] = new PVector(200,200); 
    points[1] = new PVector(300,300);
    points[2] = new PVector(400,200);
    points[3] = new PVector(500,300);
    //Inicializar curva 1
    bezierCorve[0] = new Corve(points, corveColor, corveThickness, totalPoints);

}


void draw()
{
    background(70);
    
    for(Corve _corve : bezierCorve)
    {
        _corve.DrawCorve();
        _corve.DrawControlPoitns();
    }

}

void keyPressed() 
{
    for(Corve _corve : bezierCorve)
    {
        PVector[] points = new PVector[4];
        float offset = 100;
        points[0] = new PVector(random(offset, width - offset),random(offset, height - offset));
        points[1] = new PVector(random(offset, width - offset),random(offset, height - offset));
        points[2] = new PVector(random(offset, width - offset),random(offset, height - offset));
        points[3] = new PVector(random(offset, width - offset),random(offset, height - offset));
        _corve.controlPoints = points;
        _corve.CalculateCoefficients();
    }
}
