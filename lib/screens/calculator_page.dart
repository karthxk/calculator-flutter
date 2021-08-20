import 'package:calculator/calculator_brain.dart';
import 'package:flutter/material.dart';
import 'package:calculator/components/button_container.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  List<String> buttons = [
    'C',
    ' ÷ ',
    ' × ',
    '⌫',
    '7',
    '8',
    '9',
    ' - ',
    '4',
    '5',
    '6',
    ' + ',
    '1',
    '2',
    '3',
    ' % ',
    '00',
    '0',
    '.',
    '='
  ];
  List<Color> buttonColors = [
    Color(0xFF40C3AF),
    Color(0xFF40C3AF),
    Color(0xFF40C3AF),
    Color(0xFF9D4D53),
    Color(0xFFFFFFFF),
    Color(0xFFFFFFFF),
    Color(0xFFFFFFFF),
    Color(0xFF9D4D53),
    Color(0xFFFFFFFF),
    Color(0xFFFFFFFF),
    Color(0xFFFFFFFF),
    Color(0xFF9D4D53),
    Color(0xFFFFFFFF),
    Color(0xFFFFFFFF),
    Color(0xFFFFFFFF),
    Color(0xFF9D4D53),
    Color(0xFFFFFFFF),
    Color(0xFFFFFFFF),
    Color(0xFFFFFFFF),
    Color(0xFF9D4D53),
  ];
  CalculatorBrain calculatorBrain = CalculatorBrain();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  // alignment: Alignment.bottomRight,
                  color: Color(0xFF22252D),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: Text(
                            calculatorBrain.input,
                            style: TextStyle(
                              fontSize: 30.0,
                              color: Color(0x50FFFFFF),
                            ),
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          child: Text(
                            calculatorBrain.total.length == 0
                                ? ''
                                : calculatorBrain.total,
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontSize: 65.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  color: Color(0xFF2A2D37),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      for (int i = 0; i < 5; i++)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            for (int j = 0; j < 4; j++)
                              ButtonContainer(
                                clr: buttonColors[4 * i + j],
                                text: buttons[4 * i + j],
                                onTap: () {
                                  setState(() {
                                    calculatorBrain
                                        .assignFunction(buttons[4 * i + j]);
                                  });
                                },
                              ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
