class Body {

  // visual properties
  color c = color(0);
  float radius = 15;

  // kinematic and kinetic properties
  PVector position, velocity, acceleration;
  float mass;

  // Constructors ******

  Body(PVector p0, PVector v0, PVector a0, float m) {
    position = p0;
    velocity = v0;
    acceleration = a0;
    mass = m;
  }

  Body(PVector p0, float m) {
    position = p0;
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    mass = m;
  }

  // ******

  void checkConstraints() {
    position.x = constrain(position.x, radius, width - radius);
    position.y = constrain(position.y, radius, height - radius);
    if (position.x <= radius || position.x >= width - radius) {
      velocity.x = -velocity.x;
    }
    if (position.y <= 0 || position.y >= height - radius) {
      velocity.y = -velocity.y;
    }
  }

  void propogate() {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
    checkConstraints();
  }

  void applyForce(PVector force) {
    /*
     Force = mass * acceleration
     dividing the force vector by an objects mass, will
     change the original force for all other objects!
     Therefore, a copy of the force vector object is needed
     */
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void show() {
    stroke(255);
    strokeWeight(1);
    fill(155, 100);
    ellipse(position.x, position.y, radius * 2, radius * 2);
  }
}
