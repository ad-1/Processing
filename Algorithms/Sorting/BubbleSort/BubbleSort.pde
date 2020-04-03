// Bubble Sort

float[] numbers;
int lineWidth = 10;
int n;
int i = 0;
int j = 0;

void initNumbers() {
  n = width / lineWidth;
  numbers = new float[n];
  for (int i = 0; i < numbers.length; i++) {
    numbers[i] = random(height);
  }
}

void setup() {
  size(800, 600);
  initNumbers();
}

void draw() {
  background(0);
  frameRate(20);
  for (int k = 0; k < numbers.length; k++) {
    drawBars(k);
  }
  bubble();
}

void drawBars(int k) {
  strokeWeight(lineWidth);
  if (k >= n - j) {
    stroke(0, 255, 0);
  } else if (k == i) {
    stroke(255, 0, 0);
  } else {
    stroke(255);
  }
  line(k * lineWidth, height, k * lineWidth, numbers[k]);
}

void bubble() {
  if (j < numbers.length - 1) {
    if (numbers[i] < numbers[i + 1]) {
      swap(i, i + 1);
    }
    i++;
  }
  if (i == numbers.length - j - 1) {
    i = 0;
    j++;
    println(j);
  }
}

void swap(int a, int b) {
  float temp1 = numbers[a];
  float temp2 = numbers[b];
  numbers[b] = temp1;
  numbers[a] = temp2;
}

// ***************************************
// bubble sort algorithm
void bubbleSort() {
  for (int j = 0; j < numbers.length; j++) {
    for (int i = 0; i < numbers.length - j - 1; i++) {
      if (numbers[i] < numbers[i + 1]) {
        swap(i, i + 1);
      }
    }
  }
}
// ***************************************
