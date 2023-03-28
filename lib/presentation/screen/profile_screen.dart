import 'package:aisight_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
            top: 40.0, left: 30.0, right: 30.0, bottom: 40.0),
        child: Column(
          children: [
            const Text(
              "Profile Screen",
              style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: headingColor),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: containerColor,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Name',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff00425A),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Ayushi Prasad',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff00425A),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Phone Number',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff00425A),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '+918369629997',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff00425A),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: containerColor,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Gender',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff00425A),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Female',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff00425A),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Age',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff00425A),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '20',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff00425A),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: containerColor,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Weight',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff00425A),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '57 Kg',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff00425A),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Height',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff00425A),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '160 cms',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff00425A),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
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
