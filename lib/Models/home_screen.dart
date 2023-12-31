import 'package:flutter/material.dart';
import 'package:prishatheexplorer/customizetool/text_swapper.dart';
import '../colorpallete/constants.dart';
import '../customizetool/image_swapper.dart';
import '../services/auth_services.dart';
import '../signin/login_screen.dart';

class HomeScreen extends StatelessWidget {
  //route name for our screen
  static String routeName = 'HomeScreen';
  final bool isLoggedIn;
  // Define Prisha's social media URLs
  final String instagramUrl = "https://www.instagram.com/prishatheexplorer/";
  final String twitterUrl = "https://twitter.com/prishatravels";
  final String facebookUrl = "https://www.facebook.com/prishatheexplorer/";
  final TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  void _subscribeToNewsletter() {
    if (_formKey.currentState!.validate()) {
      String email = emailController.text;
      // Implement your subscription logic here
      print('Subscribed with email: $email');
    }
  }
  HomeScreen({super.key, required this.isLoggedIn});
  @override
  Widget build(BuildContext context) {
    //scaffold color set to primary color in main in our text theme
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        leading: Builder(builder: (context) {
          return Image.asset(
            'assets/images/PTE_logo.png',
            height: 40.0,
          );
        }),
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
          Column(
            children: <Widget>[
              // Search Bar
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  style: TextStyle( // Customize text style
                    color: kTextLightColor, // Change text color to blue
                    fontWeight: FontWeight.bold, // Make text bold (optional)
                  ),
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              // Category Filters
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton<String>(
                  items: <String>[
                    'Category 1',
                    'Category 2',
                    'Category 3'
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    // Handle category change
                  },
                  hint: const Text('Select Category'),
                ),
              ),
              //Swapping Image
              ImageSwapper(),
              // Social Media Links
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: Image.asset(
                        'assets/social_link/instagram.png'), // Add your own social media icons
                    onPressed: () {
                       // You'll need to import 'package:url_launcher/url_launcher.dart'
                    },
                  ),
                  IconButton(
                    icon: Image.asset('assets/social_link/twitter.png'),
                    onPressed: () {

                    },
                  ),
                  IconButton(
                    icon: Image.asset('assets/social_link/facebook.png'),
                    onPressed: () {

                    },
                  ),
                ],
              ),
            ],
          ),
          // Newsletter Subscription
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: emailController,
                  textAlign: TextAlign.start,
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(
                      color: kTextWhiteColor,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w300),
                  decoration: const InputDecoration(
                    labelText: 'Mobile Number/Email',
                    labelStyle: TextStyle(color: kTextBlackColor,fontWeight: FontWeight.bold),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    isDense: true,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(emailPattern).hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _subscribeToNewsletter,
                  child: const Text('Subscribe'),
                ),
              ],
            ),
          ),
          TextSwapper(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                // Handle Home button tap
              },
            ),
            IconButton(
              icon: const Icon(Icons.info),
              onPressed: () {
                // Handle Info button tap
              },
            ),
            IconButton(
              icon: const Icon(Icons.mail),
              onPressed: () {
                // Handle Mail button tap
              },
            ),
          ],
        ),
      ),
    );
  }
}
