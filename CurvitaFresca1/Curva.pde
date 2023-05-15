class Corve
{
    //FORMULA p(u) = C0 + C1u + C2u2 + C3u3

    PVector[] controlPoints;
    PVector[] coefficients;
    color corveColor;
    int corveThickness;
    int totalPoints;
    float incrementU;

    Corve(PVector[] _controlPoints, color _curveColor, int _thickness, int _totalPoints){
        controlPoints = new PVector[4];
        for (int i = 0; i < 4; ++i) 
        {
            controlPoints[i] = new PVector();
            controlPoints[i] = _controlPoints[i];
        }

        corveColor = _curveColor;
        corveThickness = _thickness;
        totalPoints = _totalPoints;
        
        CalculateCoefficients();

    }

    void CalculateCoefficients() 
    { // Solo se ejecuta al cambiar los puntos de control o al 
        coefficients = new PVector[4]; //<>// //<>// //<>//
        coefficients[0] = new PVector();
        coefficients[1] = new PVector();
        coefficients[2] = new PVector();
        coefficients[3] = new PVector();
        //Los coeficientes son:
        // C0 = P0
        // C1 = -5.5P0 + 9P1 -4.5P2 + P3
        // C2 = 9P0 - 22.5P1 + 18P2 - 4.5P3
        // C3 = -4.5 + 13.5P1 - 13.5P2 + 4.5P3
        
        //Calcular la X
        coefficients[0].x = controlPoints[0].x;
        coefficients[1].x = -5.5 * controlPoints[0].x + 9 * controlPoints[1].x - 4.5 * controlPoints[2].x + controlPoints[3].x;
        coefficients[2].x = 9 * controlPoints[0].x - 22.5 * controlPoints[1].x + 18 * controlPoints[2].x - 4.5 * controlPoints[3].x;
        coefficients[3].x = -4.5 * controlPoints[0].x + 13.5 * controlPoints[1].x - 13.5 * controlPoints[2].x + 4.5 * controlPoints[3].x;

        //Calcular la Y
        coefficients[0].y = controlPoints[0].y;
        coefficients[1].y = -5.5 * controlPoints[0].y + 9 * controlPoints[1].y - 4.5 * controlPoints[2].y + controlPoints[3].y;
        coefficients[2].y = 9 * controlPoints[0].y - 22.5 * controlPoints[1].y + 18 * controlPoints[2].y - 4.5 * controlPoints[3].y;
        coefficients[3].y = -4.5 * controlPoints[0].y + 13.5 * controlPoints[1].y - 13.5 * controlPoints[2].y + 4.5 * controlPoints[3].y;
    }

    void DrawCorve()
    {
        strokeWeight(corveThickness);
        stroke(corveColor);
        incrementU = 1/(float)totalPoints;

        for (float u = 0; u <= 1; u += incrementU) 
        {
            float x = coefficients[0].x + coefficients[1].x * u + coefficients[2].x * u * u + coefficients[3].x * u * u * u;
            float y = coefficients[0].y + coefficients[1].y * u + coefficients[2].y * u * u + coefficients[3].y * u * u * u;

            point(x, y);
        }

    }


    void DrawControlPoitns()
    {
        strokeWeight(corveThickness * 2);
        stroke(255);

        for (int i = 0; i < 4; i++) 
        {
            point(controlPoints[i].x, controlPoints[i].y);
        }
    }
    
    
      
      


}
