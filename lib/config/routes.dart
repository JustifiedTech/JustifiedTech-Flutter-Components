import 'package:flutter/widgets.dart';
import 'package:justifiedtech/Tutor/category/favourites_screen.dart';
import 'package:justifiedtech/Tutor/nav/bottom_nav_screen.dart';
import 'package:justifiedtech/Tutor/nav/tabs_screen.dart';
import '../Tutor/meals/meal_detail_sceen.dart';
import '../Tutor/category/categories_screen.dart';
import '../Tutor/meals/meals_screen.dart';
import '../e-commerce/cart/cart_screen.dart';
import '../e-commerce/complete_profile/complete_profile_screen.dart';
import '../e-commerce/details/details_screen.dart';
import '../e-commerce/forgot_password/forgot_password_screen.dart';
import '../e-commerce/home/home_screen.dart';
import '../e-commerce/login_success/login_success_screen.dart';
import '../e-commerce/otp/otp_screen.dart';
import '../e-commerce/profile/profile_screen.dart';
import '../e-commerce/sign_in/sign_in_screen.dart';
import '../e-commerce/splash/splash_screen.dart';

import '../e-commerce/sign_up/sign_up_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  CategoryScreen.routeName: (context) => CategoryScreen(),
  MealsScreen.routeName: (context) => MealsScreen(),
  MealDetailScreen.routeName: (context) => MealDetailScreen(),
  FavouriteScreen.routeName: (context) => FavouriteScreen(),
  TabsScreen.routeName: (context) => TabsScreen(),
  BottomNavScreen.routeName: (context) => BottomNavScreen()
};
