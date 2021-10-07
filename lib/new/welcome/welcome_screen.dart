import 'package:flutter/material.dart';
import './components/body.dart';
import '../../config/size_config.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({Key key}) : super(key: key);
  static String routeName = '/welcome';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
