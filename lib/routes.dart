import 'package:flutter/cupertino.dart';
import 'home_screen.dart';
import 'login_screen.dart';
import 'profile_screen.dart';
import 'registration_screen.dart';

Map<String, WidgetBuilder> routes = {
  //all screens will be registered here like menifest in android
  HomeScreen.routeName: (context) => HomeScreen(isLoggedIn: false),
  LoginScreen.routeName: (context) => const LoginScreen(),
  RegistrationScreen.routeName: (context) => const RegistrationScreen(),
  ProfileScreen.routeName: (context) => const ProfileScreen(isLoggedIn: true),
};
