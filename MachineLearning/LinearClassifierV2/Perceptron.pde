class Perceptron {

  float[] weights;
  float learning_rate = 0.001;

  Perceptron(int n) {
    weights = new float[n];
    for (int i = 0; i < weights.length - 1; i++) {
      weights[i] = random(-1, 1); // initialise weights randomly
    }
    print(weights.length);
  }

  // activation function
  int activate(float i) {
    if (i > 0) {
      return 1;
    }
    return -1;
  }

  // make a prediction based on the inputs
  int predict(float[] inputs) {
    float total = 0;
    for (int i = 0; i < inputs.length; i++) {
      total += weights[i] * inputs[i];
    }
    return activate(total);
  }

  // tuning weights
  void train(float[] inputs, int target, int guess) {
    int error = target - guess;
    for (int i = 0; i < inputs.length; i++) {
      weights[i] += error * inputs[i] * learning_rate;
    }
  }

  void thinking() {
    // plot the line the perceptron currently thinks is separating the data
    float y0 = guessY(min_x);
    Point p0 = new Point(min_x, y0);
    float y1 = guessY(width);
    Point p1 = new Point(width, y1);
    line(p0.pixelX(), p0.pixelY(), p1.pixelX(), p1.pixelY());
  }

  float guessY(float x) {
    // y = mx + b, 
    return -(weights[0]/weights[1]) * x - weights[2]/weights[1];
  }
}
