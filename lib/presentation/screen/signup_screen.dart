// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:aisight_app/data/services/auth_service.dart';
import 'package:aisight_app/logic/utils/shared_preferences.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../constants/colors.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _authService = AuthService();

  late String _buttonText;
  late String _name;
  late String _email;
  late String _phoneNumber;
  late String _password;
  late String _height;
  late String _weight;

  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _buttonText = 'Create Account';
    _name = '';
    _email = '';
    _phoneNumber = '';
    _height = "";
    _weight = "";
    _password = '';
  }

  void _handleFullNameChanged(String value) {
    setState(() {
      _name = value;
    });
  }

  void _handlePhoneNumberChanged(String value) {
    setState(() {
      _phoneNumber = value;
    });
  }

  void _handleEmailNumberChanged(String value) {
    setState(() {
      _email = value;
    });
  }

  void _handlePasswordChanged(String value) {
    setState(() {
      _password = value;
    });
  }

  void _handleHeightChanged(String value) {
    setState(() {
      _height = value;
    });
  }

  void _handleWeightChanged(String value) {
    setState(() {
      _weight = value;
    });
  }

  void _handleSignUpPressed() async {
    setState(() {
      _buttonText = "Creating your account!";
    });

    final response = await _authService.signup(
        _name, _email, _password, _phoneNumber, _height, _weight);

    var token = json.decode(response.body)['token']['accessToken'];

    print(response.statusCode);

    setState(() {
      _buttonText = "Sign Up";
    });

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Logged in Successfully!"),
        ),
      );
      Navigator.of(context).pushNamed('/home');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Some error occurred."),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBarColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 40,
                      top: 20,
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 45,
                        ),
                        SvgPicture.asset(
                          "assets/hero.svg",
                          width: MediaQuery.of(context)
                              .size
                              .width, // Set the width of the image to full screen width
                          fit: BoxFit
                              .cover, // Set the image to cover the entire container
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 30,
                  right: 30,
                  top: 20,
                  bottom: 30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Lets create an account!",
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: bgColor,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 15.0),
                       border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Colors.white, // set border color to white
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Colors.white, // set border color to white
                          ),
                        ),
                        hintText: 'Name',
                        hintStyle: const TextStyle(
                          color: bgColor,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                      onChanged: _handleFullNameChanged,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 15.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Colors.white, // set border color to white
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Colors.white, // set border color to white
                          ),
                        ),
                        hintText: 'Email',
                        hintStyle: const TextStyle(
                          color: bgColor,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                      onChanged: _handleEmailNumberChanged,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 15.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Colors.white, // set border color to white
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Colors.white, // set border color to white
                          ),
                        ),
                        hintText: 'Phone',
                        hintStyle: const TextStyle(
                          color: bgColor,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                      onChanged: _handlePhoneNumberChanged,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 15.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Colors.white, // set border color to white
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Colors.white, // set border color to white
                          ),
                        ),
                        hintText: 'Height',
                        hintStyle: const TextStyle(
                          color: bgColor,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                      onChanged: _handleHeightChanged,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 15.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Colors.white, // set border color to white
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Colors.white, // set border color to white
                          ),
                        ),
                        hintText: 'Weight',
                        hintStyle: const TextStyle(
                          color: bgColor,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                      onChanged: _handleWeightChanged,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 15.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Colors.white, // set border color to white
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Colors.white, // set border color to white
                          ),
                        ),
                        hintText: 'Password',
                        hintStyle: const TextStyle(
                          color: bgColor,
                          fontWeight: FontWeight.w200,
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          child: Icon(
                            _obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: bgColor,
                          ),
                        ),
                      ),
                      obscureText: _obscureText,
                      onChanged: _handlePasswordChanged,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      "Already have an account?",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: bgColor,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/login');
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(400, 50),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 80, vertical: 15),
                            backgroundColor: bgColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            "Login",
                            style: TextStyle(color: appBarColor, fontSize: 18),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: _handleSignUpPressed,
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(400, 50),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 80, vertical: 15),
                            backgroundColor: bgColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            "Signup",
                            style: TextStyle(color: appBarColor, fontSize: 18),
                          ),
                        ),
                      ],
                    )
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
