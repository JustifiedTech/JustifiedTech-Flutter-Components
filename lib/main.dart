import 'package:flutter/material.dart';
import 'config/constants.dart';
import 'config/routes.dart';
import './screens/welcome/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: 'Muli',
          textTheme: TextTheme(
            bodyText1: TextStyle(color: kTextColor),
            bodyText2: TextStyle(color: kTextColor),
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primaryColor: Color(0xFF002244),
          scaffoldBackgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      title: 'JustifiedTech Ecommerce',
      // home: WelcomeScreen(),
      initialRoute: WelcomeScreen.routeName,
      routes: routes,
    );
  }
}
