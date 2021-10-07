import 'package:flutter/material.dart';
import '../../../config/size_config.dart';
import '../../../config/constants.dart';

class WelcomeContent extends StatelessWidget {
  const WelcomeContent({Key key, this.image, this.text}) : super(key: key);
  final String text, image;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Text(
          'Justified Store',
          style: TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
              fontSize: getProportionateScreenWidth(36)),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
        ),
        Spacer(
          flex: 2,
        ),
        Image.asset(
          image,
          height: getProportionateScreenHeight(260),
          width: getProportionateScreenWidth(235),
        ),
      ],
    );
  }
}
