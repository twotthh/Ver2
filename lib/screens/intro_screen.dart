import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A1A1A), 
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'images/Splash.png',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
