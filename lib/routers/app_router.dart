

import 'package:flutter/material.dart';
import 'package:supervisor/features/home/choose_bus_screen.dart';
import 'package:supervisor/features/login/login_screen.dart';
import 'package:supervisor/features/profile/change_password_screen.dart';
import 'package:supervisor/features/profile/lost_object_screen.dart';
import 'package:supervisor/features/profile/profile_screen.dart';
import '../features/login/splash_screen.dart';

class AppRoutes {

  static const String splashScreen = "/splash_screen";
  static const String homeScreen = "/home_screen";
  static const String loginScreen = "/login_screen";
  static const String profileScreen = "/profile_screen";
  static const String changePassScreen = "/change_password_screen";
  static const String LostObjectsScreen = "/lost_objects_screen";



  static Map<String, WidgetBuilder> routes = {
    splashScreen: (context) => const SplashScreen(),
    loginScreen: (context) => const LoginScreen(),
    homeScreen: (context) => const ChooseYourBusScreen(),
    profileScreen: (context) => const ProfileScreen(),
    changePassScreen: (context) => const ChangePasswordScreen(),
    LostObjectsScreen: (context) => const LostObjectScreen(),

  };

}