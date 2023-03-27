


class Spring {

  PVector defaultLength;
  float KM; //Constante del muelle
  color color_s;

  Spring(PVector _defaultLength, float _KM, color _color)
  {
    defaultLength = _defaultLength;
    KM = _KM;
    color_s = _color;
  }

  PVector ApplyForce(Particle _p0, Particle _p1)
  {
    PVector finalForce = new PVector();
    //Ley de Hooke
    //Fmuelle = -KM * (longitud natural - longitud real)
    //Longitud real es la distancia entre ambas particulas

    finalForce.x = -KM * (defaultLength.x - (_p1.pos.x - _p0.pos.x));
    finalForce.y = -KM * (defaultLength.y - (_p1.pos.y - _p0.pos.y));

    return finalForce;
  }

  void Draw(Particle _p0, Particle _p1)
  {
    strokeWeight(3);
    stroke(color_s);
    line(_p0.pos.x, _p0.pos.y, _p1.pos.x, _p1.pos.y);
  }
}
