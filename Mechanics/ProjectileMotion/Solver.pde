// Equations of motion

class Solver {
  float g = 9.81; // acceleration due to gravity meters per second squared

  void propogate(Projectile p) {
    // change projectile x position
    p.x = p.x0 + p.v0 * cos(p.gamma) * t;
    // change projectile y position
    p.y = p.y0 + p.v0 * sin(p.gamma) * t - 0.5 * g * pow(t, 2);
  }
}
