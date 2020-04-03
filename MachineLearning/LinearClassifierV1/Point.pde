class Point {

  float x, y;
  float a = 15;
  float b = 15;
  int label;
  
  Point(boolean training) {
    x = random(width);
    y = random(height);
    if (training) {
      if (x > y) {
      label = 1;
      } else {
        label = -1;
      }
    }
  }
  
  void show() {
    stroke(0);
    if (label == 1) {
      fill(255);
    } else {
      fill(0);
    }
    ellipse(x, y, a, b);
  }
  
}
