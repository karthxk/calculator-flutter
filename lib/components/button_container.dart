import 'package:flutter/material.dart';

class ButtonContainer extends StatelessWidget {
  ButtonContainer({this.text, this.clr, this.onTap});
  final text;
  final clr;
  final onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Color(0xFF282B33),
        ),
        alignment: Alignment.center,
        height: 65.0,
        width: 65.0,
        child: Text(
          text,
          style: TextStyle(fontSize: 25.0, color: clr),
        ),
      ),
    );
  }
}
