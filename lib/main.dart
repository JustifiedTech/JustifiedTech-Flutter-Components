import 'package:flutter/material.dart';
import './data/dummy_data.dart';
import './food/meals/meals_screen.dart';
import './config/routes.dart';
import 'package:get/get.dart';
import './config/theme.dart';
import './food/nav/bottom_nav_screen.dart';
import 'food/settings/settings_screen.dart';
import './models/meals.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> currentMeals = DUMMY_MEALS;

  Map<String, bool> _filters = {
    'isGlutenFree': false,
    'isVegan': false,
    'isVegetarian': false,
    'isLactoseFree': false
  };

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      currentMeals = DUMMY_MEALS.where((meal) {
        if (_filters['isGlutenFree'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['isVegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['isVegetarian'] && !meal.isVegetarian) {
          return false;
        }
        if (_filters['isLactoseFree'] && !meal.isLactoseFree) {
          return false;
        }

        return true;
      }).toList();
    });
  }

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
      routes: {
        MealsScreen.routeName: (context) => MealsScreen(currentMeals),
        SettingsScreen.routeName: (context) =>
            SettingsScreen(_filters, _setFilters),
        ...routes
      },

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
