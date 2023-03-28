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
  late String _phoneNumber;
  late String _password;

  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _buttonText = 'Login';
    _phoneNumber = '';
    _password = '';
  }

  void _handlePhoneNumberChanged(String value) {
    setState(() {
      _phoneNumber = value;
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

    final response = await _authService.login(_phoneNumber, _password);

    var token = json.decode(response.body)['token']['accessToken'];
    HelperFunctions.saveTokenSF(token);
    HelperFunctions.saveUserLoggedInStatus(true);

    print(response.statusCode);

    if (response.statusCode == 200) {
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
                          height: 25,
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
              height: 80,
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
                    TextField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 15.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: 'Phone Number',
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
                          borderRadius: BorderRadius.circular(15),
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
                minimumSize: const Size(300, 50),
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
            SizedBox(
              height: 10,
            ),
                      ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/login');
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(300, 50),
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
