import 'home_screen.dart';
import 'auth_services.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'login_screen.dart';

class ProfileScreen extends StatefulWidget {
  static String routeName = 'ProfileScreen';
  final bool isLoggedIn;
  const ProfileScreen({super.key, required this.isLoggedIn});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    if (!widget.isLoggedIn) {
      //we use future to go from one screen to other via duration time
      Future.delayed(const Duration(seconds: 5), () {
        //no return when user is on login screen and press back, it will not return the
        //user to the home screen
        Navigator.pushNamedAndRemoveUntil(
            context, HomeScreen.routeName, (route) => false);
      });
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        leading: Image.asset(
          'assets/images/PTE_logo.png',
          height: 40.0,
        ),
        actions: [
          if (widget.isLoggedIn)
            IconButton(
              onPressed: () async {
                AuthService().signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const ProfileScreen(isLoggedIn: false),
                  ),
                );
              },
              icon: const Icon(Icons.power_settings_new),
            )
          else
            IconButton(
              icon: const Icon(Icons.login),
              onPressed: () {
                // Navigate to login screen
                Navigator.pushNamedAndRemoveUntil(
                    context, LoginScreen.routeName, (route) => false);
              },
            ),
        ],
      ),
    );
  }
}
