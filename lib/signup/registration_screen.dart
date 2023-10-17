import 'package:flutter/material.dart';
import '../services/firebase_services.dart';
import '../signin/login_screen.dart';
import '../colorpallete/constants.dart';
import '../customizetool/drop_down.dart';

bool _passwordVisible = false;
bool isFormValid = false;
String gender='Male';
class RegistrationScreen extends StatefulWidget {
  static String routeName = 'RegistrationScreen';
  const RegistrationScreen({super.key});
  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}
class _RegistrationScreenState extends State<RegistrationScreen> {
  //validate our form now
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  void _register() async {
    setState(() {
      isFormValid = true; // Start loading
    });
    String name = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    print(name);
    print(email);
    print(password);
    print(gender);
    // Call your registration function here
    if (isFormValid) {
      Services().addInitialDetails(
        name,
        email,
        password,
        gender,
      );
    }
  }
  buildUserNameField() {
    return TextFormField(
        controller: _usernameController,
        textAlign: TextAlign.start,
        keyboardType: TextInputType.name,
        style: const TextStyle(
            color: kTextBlackColor,
            fontSize: 17.0,
            fontWeight: FontWeight.w300),
        decoration: const InputDecoration(
          labelText: 'Name',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          isDense: true,
        ),
        validator: (value) {
          //for validation
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        });
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
      });
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
      });
  }
  buildGendarField() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(
          color: kContainerColor, // Define border color here
        ),
      ),
      child: AppDropdownInput(
        //hintText: "Gender",
        options: const ["Male", "Female"],
        value: gender,
        onChanged: (String? value) {
          setState(() {
            gender = value.toString();
            // state.didChange(newValue);
          });
        },
        getLabel: (String value) => value,
      ),
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
    final ButtonStyle style = FilledButton.styleFrom(
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
            //divide the body into two half
            SizedBox(
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
                        'Guest',
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
                      'Fill Up The Details....',
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
                          buildUserNameField(), //username
                          buildEmailField(), //emailid
                          buildPasswordField(), //password
                          buildGendarField(), //Gender
                          sizedBox,
                          FilledButton(
                            onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      _register();
                                    }
                                  }, // Disable button when form is invalid
                            style: style,
                            child: const Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Register"),
                                      Icon(
                                        Icons.keyboard_arrow_right_rounded,
                                      ),
                                    ],
                                  ),
                          ),
                          sizedBox,
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()),
                              );
                            },
                            child: const Text(
                              'Already Register, Sign in here',
                              style: TextStyle(
                                fontSize: 18,
                                color: kTextBlackColor,
                                decoration: TextDecoration.underline,
                              ),
                            ),
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
