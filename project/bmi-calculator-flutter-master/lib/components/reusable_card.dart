import 'package:flutter/cupertino.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({this.color, this.cardChild, this.setGender});

  final Color color;
  final Widget cardChild;
  final Function setGender;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setGender();
      },
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: color,
        ),
      ),
    );
  }
}
//GestureDetector(
//onTap: () {
//setState(() {
//selectedColor = Gender.male;
//});
//}
