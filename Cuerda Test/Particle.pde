
class Particle
{
  PVector pos;
  PVector speed;
  PVector force;
  
  float weight;
  float size;
  float KF;
  boolean isStatic;
  color color_p;

  Particle(PVector _pos, PVector _speed, float _weight, float _size, float _KF, color _color, boolean _isStatic)
  {
    pos = _pos;
    speed = _speed;
    weight =_weight;
    size = _size;
    KF = _KF;
    isStatic = _isStatic;
    color_p = _color;
    force = new PVector();
  }

  void Move()
  {
    if (!isStatic) {

      PVector accel = new PVector(0.0, 0.0, 0.0);

      force.x += -KF * speed.x;
      force.y += -KF * speed.y;

      force.y += 9.8f;

      accel.x = force.x/weight;
      accel.y = force.y/weight;

      speed.x = speed.x + accel.x * deltaTime;
      speed.y = speed.y + accel.y * deltaTime;

      pos.x = pos.x + speed.x * deltaTime;
      pos.y = pos.y + speed.y * deltaTime;
    }
  }

  void Draw()
  {
    strokeWeight(2);
    noFill();
    stroke(color_p);
    ellipse(pos.x, pos.y, size, size);
  }
}
