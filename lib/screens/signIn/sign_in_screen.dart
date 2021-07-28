import 'package:flutter/material.dart';
import 'package:justifiedtech/screens/signIn/components/sign_in_body.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({Key key}) : super(key: key);

  static String routeName = '/sign_in';

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
