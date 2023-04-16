import 'package:flutter/material.dart';
import 'package:sportify/src/ui/bottom_nav_bar/bottom_nav_bar_screen.dart';
import 'package:sportify/src/ui/login/login_screen.dart';
import 'package:sportify/src/ui/signup/signup_screen.dart';

class Routes {
  Routes._();

  //static variables
  static const String login = '/login';
  static const String signup = '/signup';
  static const String home = '/home';

  static final routes = <String, WidgetBuilder>{
    login: (BuildContext context) => const LoginScreen(),
    signup: (BuildContext context) => const SignupScreen(),
    home: (BuildContext context) => const BottomNavBarScreen(),
  };
}
