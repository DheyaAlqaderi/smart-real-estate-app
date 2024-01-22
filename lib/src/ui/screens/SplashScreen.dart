import 'package:flutter/material.dart';
import 'package:smart_real_estate_app/src/ui/screens/welcomePage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void onPressed() {
    // Function to be executed when the button is pressed
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => welcomePage()),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            'assets/images/first_image.png', // Replace with  image path
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
          // Logo in the middle
          Center(
            child: Image.asset(
              'assets/logo.png', // Replace with logo image path
            ),
          ),
          // Button at the bottom
          Positioned(
            bottom: 30.0, // Adjust the bottom margin as needed
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 190.0, // Set your custom width
                height: 54.0, // Set your custom height
                child: ElevatedButton(
                  onPressed: onPressed,
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF252B5C), // Background color
                    onPrimary: Colors.white, // Text color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0), // Corner radius
                    ),
                  ),
                  child: Text(
                    'لنبدأ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w700,
                      height: 0,
                      letterSpacing: 0.48,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
