//Curva de interpolacion 2D

Corve corveInterpolation1;
Corve corveInterpolation2;
Corve corveInterpolation3;
Corve corveInterpolation4;

MovableItem itemMove;


void setup() 
{
    size(800, 600);
    //Curva 1
    PVector[] points = new PVector[4];
    PVector startPos;
    float offset = 100;

    color corveColor = color(255,255,0);
    int corveThickness = 15;
    int totalPoints = 100;
    //Dibuja un coso raro
    // points[0] = new PVector(200,200); 
    // points[1] = new PVector(300,300);
    // points[2] = new PVector(400,200);
    // points[3] = new PVector(500,300);
    points[0] = new PVector(random(offset, width - offset),random(offset, height - offset));
    points[1] = new PVector(random(offset, width - offset),random(offset, height - offset));
    points[2] = new PVector(random(offset, width - offset),random(offset, height - offset));
    points[3] = new PVector(random(offset, width - offset),random(offset, height - offset));
    corveInterpolation1 = new Corve(points, corveColor, corveThickness, totalPoints);
    startPos = points[0];
    //Curva 2
    corveColor = color(255,0,255);

    //Coso
    // points[0] = new PVector(500,300); 
    // points[1] = new PVector(700,350);
    // points[2] = new PVector(700,450);
    // points[3] = new PVector(500,500);
    points[0] = points[3];
    points[1] = new PVector(random(offset, width - offset),random(offset, height - offset));
    points[2] = new PVector(random(offset, width - offset),random(offset, height - offset));
    points[3] = new PVector(random(offset, width - offset),random(offset, height - offset));
    corveInterpolation2 = new Corve(points, corveColor, corveThickness, totalPoints);
    
    //Curva 3
    corveColor = color(255,0,0);
    //Coso
    // points[0] = new PVector(500,500); 
    // points[1] = new PVector(400,550);
    // points[2] = new PVector(300,550);
    // points[3] = new PVector(200,450);
    points[0] = points[3];
    points[1] = new PVector(random(offset, width - offset),random(offset, height - offset));
    points[2] = new PVector(random(offset, width - offset),random(offset, height - offset));
    points[3] = new PVector(random(offset, width - offset),random(offset, height - offset));

    corveInterpolation3 = new Corve(points, corveColor, corveThickness, totalPoints);
    
    //Curva 4
    corveColor = color(0,255,0);

    // points[0] = new PVector(200,450); 
    // points[1] = new PVector(100,400);
    // points[2] = new PVector(100,250);
    // points[3] = new PVector(200,200);
    
    points[0] = points[3];
    points[1] = new PVector(random(offset, width - offset),random(offset, height - offset));
    points[2] = new PVector(random(offset, width - offset),random(offset, height - offset));
    points[3] = startPos;
    corveInterpolation4 = new Corve(points, corveColor, corveThickness, totalPoints);

    itemMove = new MovableItem(corveInterpolation1);
}


void draw()
{
    background(70);
    
    corveInterpolation1.DrawCorve();
    corveInterpolation1.DrawControlPoitns();
    corveInterpolation2.DrawCorve();
    corveInterpolation2.DrawControlPoitns();
    corveInterpolation3.DrawCorve();
    corveInterpolation3.DrawControlPoitns();
    corveInterpolation4.DrawCorve();
    corveInterpolation4.DrawControlPoitns();
    
    itemMove.MoveItem();
}
