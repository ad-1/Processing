// Projectile motion

boolean play = false;
int n = 8;
float t = 0; // time in seconds
Projectile[] projectiles = new Projectile[n];

void initialiseProjectiles() {
  for (int i = 0; i < n; i++) {
    projectiles[i] = new Projectile(0, 20, 100, random(30, 80));
  }
  // projectiles[n - 1] = new Projectile(width/2, 740, 0, 0); // vertical drop
}

Solver solver = new Solver();

void setup() {
  size(1200, 800);
  background(255);
  // frameRate(60);
  initialiseProjectiles();
}

void draw() {
  if (play == true) {
    background(255);
    fill(0);
    for (Projectile p : projectiles) {
      if (p.y >= 0) {
        solver.propogate(p);
      }
      p.show();
    }
    t += 0.1;
  }
}

void mousePressed() {
  play = true;
}
