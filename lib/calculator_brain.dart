import 'package:math_expressions/math_expressions.dart';

class CalculatorBrain {
  String total = '';

  String input = '';
  String previousKey = '';
  bool arithmetic = false;
  void assignFunction(String pressedKey) {
    if (pressedKey == '0' ||
        pressedKey == '1' ||
        pressedKey == '2' ||
        pressedKey == '3' ||
        pressedKey == '4' ||
        pressedKey == '5' ||
        pressedKey == '6' ||
        pressedKey == '7' ||
        pressedKey == '8' ||
        pressedKey == '9' ||
        pressedKey == '00' ||
        pressedKey == '.') {
      previousKey = pressedKey;
      arithmetic = false;
      appendToString(pressedKey);
    } else if (pressedKey == ' + ' ||
        pressedKey == ' - ' ||
        pressedKey == ' % ' ||
        pressedKey == ' ÷ ' ||
        pressedKey == ' × ') {
      if (pressedKey != previousKey) {
        if (arithmetic == false) {
          appendToString(pressedKey);
          previousKey = pressedKey;
          arithmetic = true;
        } else {
          input = input.substring(0, input.length - 3) + pressedKey;
        }
      }
    } else if (pressedKey == 'C') {
      input = '';
      arithmetic = false;
      previousKey = '';
      total = '';
    } else if (pressedKey == '⌫' && input.length != 0) {
      // input = input.substring(0, input.length - previousKey.length);
      input = (input[input.length - 1] == ' ')
          ? input.substring(0, input.length - 3)
          : input.substring(0, input.length - 1);
      previousKey = pressedKey;
      arithmetic = false;
    } else if (pressedKey == '=') {
      calculation();
    }
  }

  void appendToString(String pressedKey) {
    input = input + pressedKey;
  }

  void calculation() {
    total = input.replaceAll("÷", "/").replaceAll("×", "*");
    print(total);
    Parser p = Parser();
    Expression exp = p.parse(total);
    ContextModel cm = ContextModel();
    try {
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      total = eval.toString();
      print(eval);
      // throw ('Error');

    } catch (e) {
      total = 'Error';
    }
  }
}
