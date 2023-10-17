import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Models/home_screen.dart';
import 'route/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase/firebase_options.dart';
import 'colorpallete/constants.dart';
import 'signin/login_screen.dart';

Future<void> main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Use light theme for our app
      theme: ThemeData.light().copyWith(
        //scaffold default color
        scaffoldBackgroundColor: kPrimaryColor,
        primaryColor: kPrimaryColor,
        //input decoration theme for all our app
        inputDecorationTheme: InputDecorationTheme(
          //label style for formField
          labelStyle: TextStyle(
            fontSize: 15.0,
            color: kTextLightColor,
            height: 0.5,
          ),
          //hintstyle
          hintStyle: TextStyle(
            fontSize: 16.0,
            color: kTextBlackColor,
            height: 0.5,
          ),
          //we are using underline input border
          //not outline
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: kTextLightColor,
              width: 0.7,
            ),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: kTextLightColor,
            ),
          ),
          disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: kTextLightColor,
            ),
          ),
          //on focus change color
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: kPrimaryColor,
              width: 0.7,
            ),
          ),
          //color changes when user enters wrong information,
          //we will use validators for this process
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: kErrorBorderColor,
              width: 1.2,
            ),
          ),
          //same on focus error color
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: kErrorBorderColor,
              width: 1.2,
            ),
          ),
        ),
      ),
      home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (BuildContext context, AsyncSnapshot snapshot)
          {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.data == null) {
                return LoginScreen();
              }
            }
            return Text(snapshot.error.toString());
          }
      ),
      //initial route is home screen
      //means first screen
      initialRoute: HomeScreen.routeName,
      //define the route file here in order to access the routes any where all over the application
      routes: routes,
    );
  }
}
