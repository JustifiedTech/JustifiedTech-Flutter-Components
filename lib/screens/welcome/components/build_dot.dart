import 'package:flutter/material.dart';
import '../../../config/constants.dart';

class BuildDot extends StatelessWidget {
  const BuildDot({
    Key key,
    @required this.currentIndex,
    @required this.index,
  }) : super(key: key);

  final int currentIndex;
  final int index;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 10,
      width: currentIndex == index ? 20 : 10,
      decoration: BoxDecoration(
          color: currentIndex == index ? kPrimaryColor : kSecondaryColor,
          borderRadius: BorderRadius.circular(5)),
    );
  }
}
