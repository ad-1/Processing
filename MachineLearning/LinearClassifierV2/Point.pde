// Data point

class Point {

  float w = 15;
  float h = 15;
  float x;
  float y;
  int label;
  int bias = 1;

  void randomPosition() {
    x = random(min_x, max_x);
    y = random(min_y, max_y);
  }

  // return the pixel x position of the point
  float pixelX() {
    return map(x, min_x, max_x, 0, width);
  }

  // return the pixel y position of the point
  // processing coordinate system has +y moving down screen
  // map (-1, 1) to (height, 0) to account for the flipped direction 
  float pixelY() {
    return map(y, min_y, max_y, height, 0);
  }

  // constructor for a specific point in space
  Point(float _x, float _y) {
    x = _x;
    y = _y;
    classifyPoint();
  }

  // constructor with boolean indicating point is training data
  Point(boolean training) {
    randomPosition();
    if (training) {
      classifyPoint();
    }
  }

  // classify the point as above or below the line y = f(x)
  void classifyPoint() {
    if (y > f(x)) { // if point y is above line, label 1
      label = 1;
    } else { // if point y is below line, label -1
      label = -1;
    }
  }

  // draw the ellipse on screen with a color of c
  void show(color c) {
    fill(c);
    ellipse(pixelX(), pixelY(), w, h);
  }

  void show() {
    if (label == 1) { // if point y is above line, color above
      show(above);
    } else { // if point y is below line, color below
      show(below);
    }
  }
}
