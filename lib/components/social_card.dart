import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../config/size_config.dart';

class SocialCard extends StatelessWidget {
  const SocialCard({Key key, @required this.icon, @required this.press})
      : super(key: key);
  final String icon;
  final Function press;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        decoration:
            BoxDecoration(color: Color(0xFFF5F9F9), shape: BoxShape.circle),
        height: getProportionateScreenHeight(45),
        width: getProportionateScreenWidth(45),
        margin:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
        padding: EdgeInsets.all(getProportionateScreenWidth(12)),
        child: SvgPicture.asset(icon),
      ),
    );
  }
}
