import 'package:flutter/cupertino.dart';

class ContentBox extends StatelessWidget {
  ContentBox({@required this.contentChildren, @required this.color});

  Widget contentChildren;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: color,
      ),
      child: contentChildren,
    );
  }
}