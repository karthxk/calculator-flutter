class CalculatorBrain {
  double total = 0;
  String display = '';
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
        pressedKey == '.') {
      display = display + pressedKey;
      previousKey = pressedKey;
      arithmetic = false;
      appendToString(pressedKey);
    } else if (pressedKey == ' + ' ||
        pressedKey == ' - ' ||
        pressedKey == ' mod ' ||
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
      display = '';
    } else if (pressedKey == '⌫' && input.length != 0) {
      input = input.substring(0, input.length - previousKey.length);
      previousKey = pressedKey;
      arithmetic = false;
    }
  }

  void appendToString(String pressedKey) {
    input = input + pressedKey;
  }

  void calculation() {}
}
