import 'package:get/get.dart';
import 'home_screen.dart';
import '../services/auth_services.dart';
import 'package:flutter/material.dart';
import '../colorpallete/constants.dart';
late final String profilePictureUrl;
late final String userName; // User's name
late final String userEmail; // User's email
late final String subscriptionTier; // User's subscription tier (Paid or Free)

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
        leading: Image.asset('assets/images/PTE_logo.png',
          height: 40.0,
        ),
        actions: [
          if (widget.isLoggedIn)
            IconButton(
              onPressed: () async {
                AuthService()
                .signOut()
                .whenComplete(() => Get.offAll(HomeScreen(isLoggedIn: false)));
              },
              icon: const Icon(Icons.power_settings_new),
            ),
        ],
      ),
      body: ListView(
        children: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Profile Picture
                CircleAvatar(
                  radius: 50, // Adjust the size as needed
                  backgroundImage: NetworkImage("this.profilePictureUrl"),
                ),
                // Other user information (name, email, etc.) can be added here
                // User Information
                kHalfSizedBox,
                Text('Name: '),
                Text('Email: '),
                // Subscription Tier Indicator
                kHalfSizedBox,
                Text('Subscription Tier: '),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'User Dashboard',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Recommendations:',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Add a list of Contents
                Text(
                  'Progress Tracking',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ), // Add progress tracking information here
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FilledButton(
                onPressed: () {
                  // Navigate to Paid Content
                },
                child: const Text('Paid'),
              ),
              FilledButton(
                onPressed: () {
                  // Navigate to Free Content
                },
                child: const Text('Free'),
              ),
            ],
          ),
        ),
    );
  }
}
