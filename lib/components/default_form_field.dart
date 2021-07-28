import 'package:flutter/material.dart';

class DefaultFormField extends StatelessWidget {
  const DefaultFormField(
      {Key key,
      this.hintText,
      this.labelText,
      this.prefixIcon,
      this.suffixIcon,
      this.validator})
      : super(key: key);
  final String labelText, hintText;
  final Widget prefixIcon, suffixIcon;
  final Function validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        labelText: labelText,
        hintText: hintText,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
