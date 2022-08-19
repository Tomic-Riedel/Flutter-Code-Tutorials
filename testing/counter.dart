class Counter {
  int currentValue;
  Counter({this.currentValue = 0});

  void increment() {
    currentValue++;
  }

  void decrement() {
    currentValue--;
  }
}
