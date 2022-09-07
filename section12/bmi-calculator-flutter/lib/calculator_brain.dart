import 'dart:math';

class CalculatorBrain {
  static double getBMI({int height, int weight}) {
    return weight / pow(height / 100, 2);
  }
}
