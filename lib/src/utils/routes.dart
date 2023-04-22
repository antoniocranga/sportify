import 'package:flutter/material.dart';
import 'package:sportify/src/ui/flow/basketball/basketball_screen.dart';
import 'package:sportify/src/ui/flow/football/football_screen.dart';
import 'package:sportify/src/ui/flow/profile/profile_screen.dart';
import 'package:sportify/src/ui/home/home_screen.dart';
import 'package:sportify/src/ui/login/login_screen.dart';
import 'package:sportify/src/ui/signup/signup_screen.dart';

class Routes {
  Routes._();

  //static variables
  static const String login = '/login';
  static const String signup = '/signup';
  static const String home = '/home';
  static const String football = '/football';
  static const String basketball = '/basketball';
  static const String baseball = '/baseball';
  static const String profile = '/profile';

  static final routes = <String, WidgetBuilder>{
    login: (BuildContext context) => const LoginScreen(),
    signup: (BuildContext context) => const SignupScreen(),
    home: (BuildContext context) => const HomeScreen(),
    football: (BuildContext context) => const FootballScreen(),
    basketball: (BuildContext context) => const BasketballScreen(),
    baseball: (BuildContext context) => const HomeScreen(),
    profile: (BuildContext context) => const ProfileScreen(),
  };
}
