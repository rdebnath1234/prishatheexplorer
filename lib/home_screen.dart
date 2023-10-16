import 'package:flutter/material.dart';
import 'constants.dart';
import 'image_swapper.dart';
import 'auth_services.dart';
import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  //route name for our screen
  static String routeName = 'HomeScreen';
  final bool isLoggedIn;
  const HomeScreen({super.key, required this.isLoggedIn});
  // This is a flag to track if the user is logged in
  @override
  Widget build(BuildContext context) {
    //scaffold color set to primary color in main in our text theme
    if (!isLoggedIn) {
      bool shouldNavigate = true;
      //we use future to go from one screen to other via duration time
      Future.delayed(const Duration(seconds: 5), () {
        //no return when user is on login screen and press back, it will not return the
        //user to the home screen
        Navigator.pushNamedAndRemoveUntil(
            context, LoginScreen.routeName, (route) => false);
      });
      return WillPopScope(
        onWillPop: () async {
          shouldNavigate = false;
          return true;
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: kPrimaryColor,
            leading: Image.asset(
              'assets/images/PTE_logo.png',
              height: 40.0,
            ),
            actions: <Widget>[
              isLoggedIn
                  ? IconButton(
                      icon: const Icon(Icons.exit_to_app),
                      onPressed: () {
                        // Perform log out here
                        AuthService().signOut();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen(isLoggedIn: false)),
                        );
                      },
                    )
                  : IconButton(
                      icon: const Icon(Icons.login),
                      onPressed: () {
                        // Navigate to login screen
                        if (shouldNavigate) {
                          Navigator.pushNamedAndRemoveUntil(
                              context, LoginScreen.routeName, (route) => false);
                        }
                      },
                    ),
            ],
          ),
          body: ListView(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                child: Column(
                  children: [
                    ImageSwapper(),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        leading: Builder(
          builder: (context) {
            return Image.asset(
              'assets/images/PTE_logo.png',
              height: 40.0,
            );
          }
        ),
        actions: <Widget>[
          isLoggedIn
              ? IconButton(
                  icon: const Icon(Icons.exit_to_app),
                  onPressed: () {
                    // Perform log out here
                    AuthService().signOut();
                  },
                )
              : IconButton(
                  icon: const Icon(Icons.login),
                  onPressed: () {
                    // Navigate to login screen
                    Navigator.pushNamedAndRemoveUntil(
                        context, LoginScreen.routeName, (route) => false);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2,
            child: Column(
              children: [
                ImageSwapper(),
              ],
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                // Handle Home button tap
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About'),
              onTap: () {
                // Handle About button tap
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.mail),
              title: const Text('Contact Us'),
              onTap: () {
                // Handle Contact Us button tap
                Navigator.pop(context); // Close the drawer
              },
            ),
          ],
        ),
      ),
    );
  }
}
