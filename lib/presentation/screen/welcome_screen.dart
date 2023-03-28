import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBarColor,
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 200,
            ),
            Image.asset("assets/logo.png", height: 200),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "AIsight",
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 40,
                right: 40,
                top:20,
              ),
              child: Text(
                "Protect your vision with every scan",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 60,
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
             const SizedBox(
              height: 30,
            ),
             ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/signup');
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
                "Signup",
                style: TextStyle(color: appBarColor, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
