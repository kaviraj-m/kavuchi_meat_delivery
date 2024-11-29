import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart'; // Ensure you import the Lottie package
import 'main.dart'; // To navigate to HomePage

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  // Navigate to the Home Page after a delay of 3 seconds
  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 3), () {});
    // Apply a fade transition when navigating to HomePage
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => HomePage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          // Fade transition
          var fadeAnimation = Tween(begin: 0.0, end: 1.0).animate(animation);
          return FadeTransition(opacity: fadeAnimation, child: child);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Logo at the top
            Center(
              child: Image.asset(
                'assets/images/logo1.png', // Your logo image
                width: 300,
                height: 300,
              ),
            ),
            SizedBox(height: 30),

            // Lottie Animation: Fish Animation
            Lottie.asset(
              'assets/lottie/fish_animation.json', // Fish animation
              width: 300,
              height: 300,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 40),

            // GIF Image at the bottom
            Image.asset(
              'assets/images/loading.gif', // Your loading GIF file
              width: 400,
              height: 100,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
