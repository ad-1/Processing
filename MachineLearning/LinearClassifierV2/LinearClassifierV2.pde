/* Linear Classification - Perceptron */

/*******************************************************/

/* Initialise Constants */

// linearly separable data about the line f(x)
float f(float x) {
  return 0.1 * x - 0.12;
}

// coordinate system min and max values
// will be used for mapping data point values to pixel values
float min_x = -1;
float max_x = +1;
float min_y = -1;
float max_y = +1;

// colors for representing data above and below line
color above = 0;
color below = 255;

// number of elements in training and testing data sets
int nTrain = 100;
int nTest = 100;

// initialise traning and testing data
Point[] trainingData = new Point[nTrain];
Point[] testingData = new Point[nTest];

void getData() {
  for (int i = 0; i < nTrain; i++) {
    trainingData[i] = new Point(true);
  }
  for (int i = 0; i < nTest; i++) {
    testingData[i] = new Point(false);
  }
}

// new perceptron

int nargs = 3; // number of weights for the perceptron, x, y, bias
Perceptron perceptron;

// classified data line
Point p0 = new Point(min_x, f(min_x));
Point p1 = new Point(max_x, f(max_x));

/*******************************************************/

/* Model Training */

void setup() {
  background(255);
  frameRate(25);
  size(800, 800);
  perceptron = new Perceptron(nargs);
  getData();
}

void separaterLine() {
  line(p0.pixelX(), p0.pixelY(), p1.pixelX(), p1.pixelY());
}

void draw() {
  background(255);
  separaterLine();
  for (Point p : trainingData) {
    p.show();
  }
  train();
  displayTestData();
  perceptron.thinking();
}

void train() {
  for (Point p : trainingData) {
    float[] position = {p.x, p.y, p.bias};
    int guess = perceptron.predict(position);
    perceptron.train(position, p.label, guess);
    if (guess == p.label) {
      p.show(color (0, 255, 0)); // if perceptron guess is correct
    } else {
      p.show(color (255, 0, 0)); // bad perceptron. wrong guess
    }
  }
}

/*******************************************************/


/* Model testing and validation */

void displayTestData() {
  for (Point p : testingData) {
    if (p.label == 1) {
      p.show(255);
    } else {
      p.show(0);
    }
  }
}

void mousePressed() {
  test();
}

void test() {
  for (Point p : testingData) {
    float[] position = {p.x, p.y, p.bias};
    p.label = perceptron.predict(position);
  }
}
