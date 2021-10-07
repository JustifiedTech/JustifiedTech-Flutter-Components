import 'package:flutter/material.dart';
import '../signIn/sign_in_screen.dart';

class SignUpBody extends StatefulWidget {
  SignUpBody({Key key}) : super(key: key);

  @override
  _SignUpBodyState createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('sign up page'),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, SignInScreen.routeName,
                    arguments: {'id': 2, 'data': 'from Sign up'});
              },
              child: Text('Sign in'))
        ],
      ),
    );
  }
}
