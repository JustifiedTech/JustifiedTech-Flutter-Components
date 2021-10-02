import 'package:flutter/material.dart';
import '../config/size_config.dart';
import '../config/constants.dart';

class AskButton extends StatelessWidget {
  const AskButton(
      {Key key, @required this.ask, @required this.press, @required this.text})
      : super(key: key);
  final String ask, text;
  final Function press;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          ask,
          style: TextStyle(
              fontSize: getProportionateScreenWidth(16),
              fontWeight: FontWeight.w700),
        ),
        TextButton(
            onPressed: press,
            child: Text(
              text,
              style: TextStyle(
                  fontSize: getProportionateScreenWidth(16),
                  color: kPrimaryColor),
            )),
      ],
    );
  }
}
