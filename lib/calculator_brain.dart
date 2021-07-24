class CalculatorBrain {
  double total = 0;
  String input = '';
  String previousKey = '';
  bool arith = false;
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
        pressedKey == '.') {
      previousKey = pressedKey;
      arith = false;
      appendToString(pressedKey);
    } else if (pressedKey == ' + ' ||
        pressedKey == ' - ' ||
        pressedKey == ' mod ' ||
        pressedKey == ' % ' ||
        pressedKey == ' ÷ ' ||
        pressedKey == ' × ') {
      if (pressedKey != previousKey) {
        if (arith == false) {
          appendToString(pressedKey);
          previousKey = pressedKey;
          arith = true;
        } else {
          input = input.substring(0, input.length - 3) + pressedKey;
        }
      }
    } else if (pressedKey == 'C') {
      input = '';
      arith = false;
      previousKey = '';
    } else if (pressedKey == '⌫' && input.length != 0) {
      input = input.substring(0, input.length - previousKey.length);
      previousKey = pressedKey;
      arith = false;
      // print(input[input.length - 1]);
    }
  }

  void appendToString(String pressedKey) {
    input = input + pressedKey;
  }
}
