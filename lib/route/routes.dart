import 'package:flutter/material.dart';
import '../Models/home_screen.dart';
import '../signin/login_screen.dart';
import '../Models/profile_screen.dart';
import '../signup/registration_screen.dart';

Map<String, WidgetBuilder> routes = {
  //all screens will be registered here like menifest in android
  HomeScreen.routeName: (context) => HomeScreen(isLoggedIn: false),
  LoginScreen.routeName: (context) => const LoginScreen(),
  RegistrationScreen.routeName: (context) => const RegistrationScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(isLoggedIn: true),
  };
