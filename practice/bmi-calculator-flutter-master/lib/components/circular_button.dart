import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CircularButton extends StatelessWidget {
  CircularButton({@required this.onPressed, @required this.iconData});

  final Function onPressed;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return
      RawMaterialButton(
        onPressed: onPressed,
        fillColor: Color(0xFF434653),
        shape: CircleBorder(),
        constraints: BoxConstraints.tightFor(
          width: 56.0,
          height: 56.0,
        ),
        child: Icon(
          iconData,
        ),
      );
  }
}