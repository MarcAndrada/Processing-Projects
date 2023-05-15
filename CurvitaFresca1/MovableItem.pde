class MovableItem
{
    Corve currentCorve;
    float curvePoint = 0;
    float speed = 0.04;

    MovableItem(Corve _corveFollow)
    {
        currentCorve = _corveFollow;
    }

    void MoveItem()
    {
        curvePoint += speed;
        if(curvePoint >= 1)
        {
            EndCorve();
        }
        
        float x = currentCorve.coefficients[0].x +
        currentCorve.coefficients[1].x * curvePoint +
        currentCorve.coefficients[2].x * curvePoint * curvePoint + 
        currentCorve.coefficients[3].x * curvePoint * curvePoint * curvePoint;
        float y = currentCorve.coefficients[0].y + 
        currentCorve.coefficients[1].y * curvePoint +
        currentCorve.coefficients[2].y * curvePoint * curvePoint +
        currentCorve.coefficients[3].y * curvePoint * curvePoint * curvePoint;


        strokeWeight(100);
        stroke(0,0,255);
        point(x,y);
        

    }

    void EndCorve()
    {
        if(currentCorve.controlPoints[3] == corveInterpolation1.controlPoints[0])
        {
            currentCorve = corveInterpolation1;
        }
        else if(currentCorve.controlPoints[3] == corveInterpolation2.controlPoints[0])
        {
             currentCorve = corveInterpolation2;
        }
        else if(currentCorve.controlPoints[3] == corveInterpolation3.controlPoints[0])
        {
             currentCorve = corveInterpolation3;
        }
        else if(currentCorve.controlPoints[3] == corveInterpolation4.controlPoints[0])
        {
             currentCorve = corveInterpolation4;
        }
        
        curvePoint = 0;
    }
}
