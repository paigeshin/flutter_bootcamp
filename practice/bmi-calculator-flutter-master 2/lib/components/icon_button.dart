import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.iconData, @required this.onPressed});

  IconData iconData;
  Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF434653),
      child: Icon(iconData),
    );
  }
}
