class Perceptron {
  
  float[] weights = new float[2];
  float learning_rate = 0.1;
  
  Perceptron() {
    // initialise weights randomly
    for (int i = 0; i < weights.length; i ++) {
      weights[i] = random(-1, 1);
    }
  }

  int activate(float i) {
    if (i >= 0) {
      return 1;
    }
    return -1;
  }
  
  int predict(float[] inputs) {
    float total = 0;
    for (int i = 0; i < inputs.length; i++) {
      total += weights[i] * inputs[i];
    }
    return activate(total);
  }
  
  void train(float[] inputs, int target) {
    int guess = perceptron.predict(inputs);
    int error = target - guess;
    // tuning weights
    weights[0] += error * inputs[0] * learning_rate;
    weights[1] += error * learning_rate;
    // thinking(inputs[0]);
  }
  
  void thinking(float x) {
    // y = mx + b
    float x0 = 0;
    float y0 = weights[1]; // b
    float x1 = width;
    float y1 = (weights[0] * x) + y0;
    strokeWeight(0.51);
    stroke(235, 245, 235);
    line(x0, y0, x1, -y1);
  }
  
}
