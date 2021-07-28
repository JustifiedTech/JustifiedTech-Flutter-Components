import 'package:flutter/widgets.dart';
import '../screens/welcome/welcome_screen.dart';
import '../screens/signIn/sign_in_screen.dart';
import '../screens/signUp/sign_up_screen.dart';

final Map<String, WidgetBuilder> routes = {
  WelcomeScreen.routeName: (context) => WelcomeScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
};
