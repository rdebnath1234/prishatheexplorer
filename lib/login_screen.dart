import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'profile_screen.dart';
import 'constants.dart';
import 'registration_screen.dart';
import 'auth_services.dart';
import 'custom_buttons.dart';
bool _passwordVisible = false;
class LoginScreen extends StatefulWidget {
  static String routeName = 'LoginScreen';
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //validate our form now
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  void _login() async {
    String email = _emailController.text;
    String password = _passwordController.text;
    String domain = email.split('@')[1];
    if (domain == 'gmail.com') {
      AuthService().signInwithGoogle();
      Navigator.pushReplacementNamed(
        context,
        ProfileScreen.routeName,
      );
    } else {
      AuthService().signInWithEmailAndPassword(email, password);
    }
  }
  buildEmailField() {
    return TextFormField(
      controller: _emailController,
      textAlign: TextAlign.start,
      keyboardType: TextInputType.emailAddress,
      style: const TextStyle(
          color: kTextBlackColor, fontSize: 17.0, fontWeight: FontWeight.w300),
      decoration: const InputDecoration(
        labelText: 'Mobile Number/Email',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        isDense: true,
      ),
      validator: (value) {
        //for validation
        RegExp regExp = RegExp(emailPattern);
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        } else if (!regExp.hasMatch(value)) {
          return 'Please enter a valid email address';
          //if it does not match the pattern, like
          //it not contains @
        }
        return null;
      },
    );
  }
  buildPasswordField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: _passwordVisible,
      textAlign: TextAlign.start,
      keyboardType: TextInputType.text,
      style: const TextStyle(
          color: kTextBlackColor, fontSize: 17.0, fontWeight: FontWeight.w300),
      decoration: InputDecoration(
        labelText: 'Password',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        isDense: true,
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
          icon: Icon(
            _passwordVisible ? Icons.visibility_off_outlined : Icons.visibility,
          ),
          iconSize: kDefaultPadding,
        ),
      ),
      validator: (value) {
        if (value!.length < 5) {
          return 'Must be more than 5 characters';
        }
        return null;
      },
    );
  }
  @override
  void initState() {
    super.initState();
    //TODO : implement initState
    _passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        textStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: kPrimaryColor);
    return GestureDetector(
      //when user taps anywhere on the screen, key board hides
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, HomeScreen.routeName);
                },
                child: Row(
                  children: [
                    Icon(Icons.arrow_back_ios),
                  ],
                ),
              ),
            ),
            //divide the body into two half
            Container(
              //use media query in order to fit all screen sizes in same manner
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/PTE_logo.png',
                    height: 100.0,
                    width: 100.0,
                  ),
                  kHalfSizedBox,
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Hi ',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 35.0,
                          color: kTextWhiteColor,
                        ),
                      ),
                      Text(
                        'Kid',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 35.0,
                          color: kTextWhiteColor,
                        ),
                      ),
                    ],
                  ),
                  sizedBox,
                  Container(
                    margin: const EdgeInsets.only(
                      left: kDefaultPadding,
                      right: kDefaultPadding,
                    ),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: kTextWhiteColor),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(kDefaultPadding * 3),
                  topRight: Radius.circular(kDefaultPadding * 3),
                ),
                color: kOtherColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: Column(
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          sizedBox,
                          buildEmailField(),
                          sizedBox,
                          buildPasswordField(),
                          sizedBox,
                          DefaultButton(
                            onPress: () {
                              if (_formKey.currentState!.validate()) {
                                _login();
                              }
                            },
                            title: 'Log IN',
                            iconData: Icons.arrow_forward_outlined,
                          ),
                          sizedBox,
                          const Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              'Forgot Password',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: 15.0,
                              ),
                            ),
                          ),
                          sizedBox,
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, RegistrationScreen.routeName);
                            },
                            style: style,
                            child: const Text('Register'),
                          ),
                          const Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  color: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  'OR',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Expanded(
                                child: Divider(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          sizedBox,
                          //social media link like google, facebook,linkedin
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RoundedSocialButton(
                                imagePath: "assets/social_link/google.png",
                                onPressed: () async {
                                  try {
                                    await AuthService().signInwithGoogle();
                                    Navigator.pushReplacementNamed(
                                      context,
                                      ProfileScreen.routeName,
                                    );
                                  } catch (e) {
                                    print("Error signing in with Google: $e");
                                    // Handle the error as needed
                                  }
                                },
                              ),
                              RoundedSocialButton(
                                imagePath: "assets/social_link/facebook.png",
                                onPressed: () {},
                              ),
                              RoundedSocialButton(
                                imagePath: "assets/social_link/linkedin.png",
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
