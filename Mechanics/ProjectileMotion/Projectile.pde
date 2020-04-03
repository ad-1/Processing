class Projectile {

  float w = 20;
  float h = w;

  // initial condition variables
  float x0, y0, v0, gamma;
  
  // initialising variables
  float x = 0;
  float y = 0;
  
  color c = color(random(0, 255), random(0, 255), random(0, 255));

  Projectile(float X0, float Y0, float V0, float launchAngle) {
    x0 = X0;
    y0 = Y0;
    v0 = V0;
    gamma = launchAngle * PI/180;
  }
  
  float mapY() {
    return map(y, 0, height, height, 0);
  }
  
  void show() {
    fill(c);
    ellipse(x, mapY(), w, h);
  }
  
}
