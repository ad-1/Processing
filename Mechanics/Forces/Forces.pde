// Simulating forces on bodies with mass

int n = 5;
Body[] bodies = new Body[n];

// Constants and coefficients
float g = 2; // acceleration due to gravity m/s^2
float mu = -0.8; // coefficient of friction
float rho = 1; // density kg/m^3
float area = 1; // area m^2
float Cd = 0.05; // coefficient of drag

// Forces
PVector gravity = new PVector(0, g);
PVector wind, friction, drag;

void initBodies() {
  for (int i = 0; i < n; i++) {
    PVector initPosition = new PVector(random(0, width), 0);
    bodies[i] = new Body(initPosition, random(0, 80));
  }
}

void setup() {
  size(600, 600);
  background(0);
  initBodies();
}

void draw() {
  background(0);
  for (Body b : bodies) {
    b.show();
    b.propogate();
    // collisions(b);
    calcGravity(b);
    calcFriction(b);
    calcDrag(b);
    if (mousePressed) {
      wind = new PVector(random(-50, 50), -80);
      b.applyForce(wind);
    }
  }
}

void collisions(Body b) {
  for (Body other : bodies) {
    if (b != other && b.collision(other)) {
      b.velocity.mult(-1);
      other.velocity.mult(-1);
    }
  }
}

void calcGravity(Body b) {
  PVector gravityCopy = gravity.copy();
  gravityCopy.mult(b.mass); // scale gravity my bodies mass
  b.applyForce(gravityCopy);
}

void calcFriction(Body b) {
  if (b.position.y >= height - b.radius && b.velocity.x != 0) {
    friction = b.velocity.copy();
    friction.normalize();
    friction.mult(mu);
    b.applyForce(friction);
  }
}

void calcDrag(Body b) {
  PVector drag = b.velocity.copy();
  drag.normalize();
  drag.mult(-0.5 * rho * area * pow(b.velocity.mag(), 2));
  b.applyForce(drag);
}
