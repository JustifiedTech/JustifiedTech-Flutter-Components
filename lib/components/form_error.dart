import 'package:flutter/material.dart';
import '../config/size_config.dart';

class FormError extends StatelessWidget {
  FormError({
    Key key,
    @required this.errors,

  }) : super(key: key);

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: List.generate(
            errors.length, (index) => errorText(error: errors[index])));
  }

  Row errorText({String error}) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.cancel,
          color: Colors.red,
        ),
        SizedBox(
          width: getProportionateScreenWidth(5),
        ),
        Text(error,
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.w400)),
      ],
    );
  }
}
