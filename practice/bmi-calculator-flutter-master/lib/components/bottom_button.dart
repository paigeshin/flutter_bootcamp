import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../style.dart';

class BottomButton extends StatelessWidget {
  BottomButton({this.onPressed, this.title});

  final Function onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints.tightFor(
        width: double.infinity,
      ),
      fillColor: fAccentColor,
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      onPressed: onPressed,
    );
  }
}
