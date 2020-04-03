Perceptron perceptron;
Point[] trainingData = new Point[100];
Point[] testingData = new Point[100];

void setup() {
  frameRate(10);
  size(800, 800);
  background(255);
  perceptron = new Perceptron();
  getData();
}

void getData() {
  for (int i = 0; i < trainingData.length; i++) {
    trainingData[i] = new Point(true);
    if (i < testingData.length) {
      testingData[i] = new Point(false);
    }
  }  
}

void draw() {
  line(0, 0, width, height);
  train();
}

void train() {
  for (Point p : trainingData) {
    float[] position = {p.x, p.y};
    perceptron.train(position, p.label);
    int guess = perceptron.predict(position);
    verify(guess, p);
  }
}

void verify(int guess, Point p) {
  if (guess == p.label) {
      fill(0, 255, 0); // if perceptron guess is correct
    } else {
      fill(255, 0, 0); // bad perceptron. wrong guess
    }
    ellipse(p.x, p.y, p.a, p.b);
}

void test() {
  for (Point p : testingData) {
    float[] position = {p.x, p.y};
    p.label = perceptron.predict(position);
    p.show();
  }
}

void mousePressed() {
  test();
  trained();
}

void trained() {
    // perceptron weights have tuned m and b for equation y = mx + b
    // this line will converge on the line which separates the data
    float x0 = 0;
    float y0 = perceptron.weights[1]; // b
    float x1 = width;
    float y1 = (perceptron.weights[0] * x1) + y0;
    stroke(2);
    line(x0, y0, x1, -y1);
  }
