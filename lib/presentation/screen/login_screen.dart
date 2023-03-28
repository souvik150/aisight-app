// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api

import 'dart:convert';
import 'package:flutter/material.dart';
import '../../data/services/auth_service.dart';
import '../../logic/utils/shared_preferences.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _authService = AuthService();

  late String _buttonText;
  late String _email;
  late String _password;

  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _buttonText = 'Login';
    _email = '';
    _password = '';
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

  void _handleLoginPressed() async {
    setState(() {
      _buttonText = "Logging you in!";
    });

    final response = await _authService.login(_email, _password);

    HelperFunctions.saveUserLoggedInStatus(true);
    HelperFunctions.saveUserEmailSF(_email);

    Navigator.of(context).pushNamed('/home');
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
                      "Welcome Back!",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: bgColor,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      style: const TextStyle(
                        color: Colors.white, // set text color to white
                      ),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 15.0,
                        ),
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
                        hintStyle: TextStyle(
                          color: Colors.white.withOpacity(
                              0.5), // set hint text color to white with opacity
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                      onChanged: _handleEmailNumberChanged,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      style: const TextStyle(
                        color: Colors.white, // set text color to white
                      ),
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
                      "New to AI Sight?",
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
                            Navigator.of(context).pushNamed('/signup');
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
                            "Signup",
                            style: TextStyle(color: appBarColor, fontSize: 18),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: _handleLoginPressed,
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(400, 50),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 80, vertical: 15),
                            backgroundColor: bgColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            _buttonText,
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
