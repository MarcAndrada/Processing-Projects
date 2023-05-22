
//https://ixora.io/projects/camera-3D
import camera3D.Camera3D;


Camera3D estereoscopy;
float angleX = 0;
float angleY = 0;
float angleZ = 0;

float sphereX = 0;
float sphereZ = 0;
void setup() 
{
    size(500,500, P3D);
    perspective();
    estereoscopy = new Camera3D(this);
    estereoscopy.setBackgroundColor(color(160));
    estereoscopy.renderDefaultAnaglyph().setDivergence(1);

}

void preDraw(){
    angleX+= 0.4f;
    angleY+= 0.7f;
    angleZ+= 1.2f;

    sphereX += 6;
    sphereZ += 19;
}

void draw() 
{
    strokeWeight(8);
    stroke(0);
    fill(255);
    pushMatrix();
    
    translate(width/2, height/2, -400);
    rotateX(radians(angleX));
    rotateY(radians(angleY));
    rotateZ(radians(angleZ));
    box(250);
    popMatrix();
    pushMatrix();
    strokeWeight(1);
    translate(width/2, height/2, 0);
    
    pushMatrix();
    rotateX(radians(sphereX));
    translate(0,0,200);
    fill(color(0,255,0));
    sphere(30);
    popMatrix();

    pushMatrix();
    rotateZ(radians(sphereZ));
    translate(200,0,0);
    fill(color(255,0,0));
    sphere(30);
    popMatrix();

    fill(color(255,255,0));
    sphere(50);
    popMatrix();
}

void postDraw(){

}
