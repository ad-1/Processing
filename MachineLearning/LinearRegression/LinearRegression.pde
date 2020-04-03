// Linear Regression

/* 
 A line of best fit is a straight line that is
 the best approximation of a given set of data.
 */

 Point[] data = new Point[100];
int numPoints = 0;
float m, b, mean_x, mean_y;
float total_x = 0;
float total_y = 0;
float c0 = 0;
float c1 = 0;

void setup() {
  size(500, 500);
}

void draw() {
  background(30, 30, 30);
  stroke(223, 30, 38);
  strokeWeight(2);
  line(0, f(0), width, f(width));
  for (int i = 0; i < numPoints; i++) {
    fill(255);
    noStroke();
    Point p = data[i];
    ellipse(p.x, p.y, p.w, p.h);
  }
}

float f(float x) {
  return (m * x) + b;
}

// least squares method
void mousePressed() {
  Point p = new Point(mouseX, mouseY);
  data[numPoints] = p;
  total_x += p.x;
  total_y += p.y;
  numPoints++;
  mean_x = total_x / numPoints;
  mean_y = total_y / numPoints;
  c0 += (p.x - mean_x) * (p.y - mean_y);
  c1 += pow(p.x - mean_x, 2);
  m = c0 / c1;
  b = mean_y - (m * mean_x);
}
