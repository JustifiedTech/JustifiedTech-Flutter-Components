import 'package:flutter/material.dart';
// import '../Tutor/category/categories_screen.dart';
import './config/routes.dart';
// import './e-commerce/splash/splash_screen.dart';
import 'package:get/get.dart';
import './config/theme.dart';
import 'Tutor/nav/tabs_screen.dart';
import 'Tutor/nav/bottom_nav_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'JTech Kit',
      darkTheme: MyThemes().darkTheme(),
      theme: MyThemes().lightTheme(),
      themeMode: ThemeMode.system,
      // home: SplashScreen(),
      // We use routeName so that we dont need to remember the name
      initialRoute: BottomNavScreen.routeName,
      routes: routes,

      // onGenerateRoute: (settings) {
      //   print(settings.name);
      //   // if (settings.name == '/') {}

      //   return MaterialPageRoute(builder: (context) => CategoryScreen());
      // },

      // onGenerateInitialRoutes: (){},
      // onUnknownRoute: (){},
      // onDispose: ,
      
    );
  }
}
