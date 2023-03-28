// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:aisight_app/data/services/auth_service.dart';
import 'package:aisight_app/logic/utils/shared_preferences.dart';

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
    _password = '';
    _height = "";
    _weight = "";
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

    if (response.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("OTP Sent Successfully!"),
        ),
      );
      Navigator.of(context)
          .pushNamed('/otp-verification', arguments: _phoneNumber);
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.black, // Set the background color with opacity
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
                          height: 25,
                        ),
                        Image.asset(
                          "assets/images/signup_hero.png",
                          width:
                              200, // Set the width of the image to full screen width
                          fit: BoxFit
                              .cover, // Set the image to cover the entire container
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Image.asset(
                          "assets/images/logo_jaunnt.png",
                          width:
                              200, // Set the width of the image to full screen width
                          fit: BoxFit
                              .cover, // Set the image to cover the entire container
                        ),
                        const Text("Rediscover travel like never before"),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 30,
                  right: 30,
                  top: 20,
                  bottom: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: 'Name',
                        hintStyle: const TextStyle(
                          color: Color(0xFF00425A),
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
                            horizontal: 20.0, vertical: 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: 'Phone Number',
                        hintStyle: const TextStyle(
                          color: Color(0xFF00425A),
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
                            horizontal: 20.0, vertical: 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: 'Email',
                        hintStyle: const TextStyle(
                          color: Color(0xFF00425A),
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
                            horizontal: 20.0, vertical: 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        hintText: 'Password',
                        hintStyle: const TextStyle(
                          color: Color(0xFF00425A),
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
                            color: const Color(0xff00425A),
                          ),
                        ),
                      ),
                      obscureText: _obscureText,
                      onChanged: _handlePasswordChanged,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Already a Jaunnteer?",
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xff0A3530),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/');
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(150, 50),
                            backgroundColor: const Color(0xffD8E9EB),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            "Login",
                            style: TextStyle(color: Color(0xff012248)),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: _handleSignUpPressed,
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(150, 50),
                            backgroundColor: const Color(0xff00425A),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            _buttonText,
                            style: const TextStyle(color: Colors.white),
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
