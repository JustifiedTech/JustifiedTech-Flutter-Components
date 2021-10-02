import 'package:flutter/material.dart';
import '../config/constants.dart';
import '../config/size_config.dart';

class Button extends StatelessWidget {
  const Button({Key key, @required this.press, @required this.text, this.icon})
      : super(key: key);
  final String text;
  final Function press;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(56),
      child: TextButton.icon(
style: TextButton.styleFrom(
   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
backgroundColor: kPrimaryColor),

        onPressed: press,
        label: Text(
          text,
          style: TextStyle(
              color: kPrimaryLightColor,
              fontSize: getProportionateScreenWidth(18)),
        ),
        icon: Icon(
          icon,
          color: kPrimaryLightColor,
        ),
      ),
    );
  }
}
