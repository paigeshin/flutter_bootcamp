import 'package:flutter/cupertino.dart';

import '../style.dart';

class BottomButton extends StatelessWidget {
  BottomButton({this.title, this.onPressed});

  String title;
  Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        color: kAccentColor,
        child: Center(
          child: Text(title, style: kBigTextStyle),
        ),
      ),
    );
  }
}
