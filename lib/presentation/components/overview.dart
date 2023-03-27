import 'package:flutter/material.dart';

class Overview extends StatelessWidget {
  const Overview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Nandi Hills',
                      style: TextStyle(
                        fontSize: 24,
                        color: Color(0xff00425A),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Nandi Hills is a scenic hill station located in the state of Karnataka, India. It is situated at an altitude of 1,478 meters above sea level and is a popular tourist destination for both locals and visitors from around the world.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
