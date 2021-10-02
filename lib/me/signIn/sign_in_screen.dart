import 'package:flutter/material.dart';
import './components/sign_in_body.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = '/sign_in';
  SignInScreen({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppbar(
          title: 'Sign In',
        ),
        body: SignInBody(),
      ),
    );
  }

  AppBar buildAppbar({String title}) {
    return AppBar(
      centerTitle: true,
      title: Text(
        title,
      ),
    );
  }
}
