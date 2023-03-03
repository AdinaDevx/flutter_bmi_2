import 'dart:math';

class BmiCalculatorData {
  static double calculateBmi({double? height, int? kg}) {
    final bmiJoop = kg! / pow(height! / 100, 2);
    return bmiJoop;
  }

  static String? bmiResult(double bmiJoop) {
    if (bmiJoop >= 25) {
      return 'Толстый';
    } else if (bmiJoop > 18.5) {
      return 'Норма';
    } else if (bmiJoop < 18.5) {
      return 'Худой';
    }
    return null;
  }

  static String? giveDescription(double bmiJoop) {
    if (bmiJoop >= 25) {
      return 'Надо срочно похудеть';
    } else if (bmiJoop > 18.5) {
      return 'Норма вы можете писать код';
    } else if (bmiJoop < 18.5) {
      return 'Надо вес набрать!';
    }
    return null;
  }
}
