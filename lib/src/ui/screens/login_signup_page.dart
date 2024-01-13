import 'package:flutter/material.dart';
import '../widgets/login_screen.dart';
import '../widgets/signup_screen.dart';



class login_signup extends StatefulWidget {
  const login_signup({super.key});

  @override
  State<login_signup> createState() => _login_signupState();
}

class _login_signupState extends State<login_signup> {


  bool isDesign1 = true;

  void showDesign1() {
    setState(() {
      isDesign1 = true;
    });
  }

  void showDesign2() {
    setState(() {
      isDesign1 = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 270.0,
              width: double.infinity,
              child: Stack(
                children: [
                  Container(
                    height: 200.0,
                    child: Stack(
                        fit: StackFit.expand,
                        children: [
                          ClipRect(
                            child: Image.asset(
                              "assets/images/login_image.png",
                              fit: BoxFit.cover,
                            width: double.infinity,
                                              ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF252B5C).withOpacity(0.5),
                            ),
                          ),
                          Center(
                              child: Image.asset("assets/logo.png",
                                width: 153.31,
                                height: 144.38,
                              )
                          ),
                      ]
                    ),
                  ),
                  Positioned(
                      bottom:30,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 140.0, // Set your custom width
                              height: 54.0, // Set your custom height
                              child: ElevatedButton(
                                onPressed: showDesign1,
                                style: ElevatedButton.styleFrom(
                                  primary: isDesign1 ?Color(0xFF1F4C6B): Colors.white, // Background color
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0), // Corner radius
                                  ),

                                ),
                                child: Text(
                                  'تسجيل الدخول',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: isDesign1 ?Colors.white:Color(0xFF1F4C6B),
                                    fontSize: 15,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,
                                    height: 0.09,
                                    letterSpacing: -0.24,
                                  ),
                                ),
                              ),
                            ),

                            Container(
                              width: 140.0, // Set your custom width
                              height: 54.0, // Set your custom height
                              child: ElevatedButton(
                                onPressed: showDesign2,
                                style: ElevatedButton.styleFrom(
                                  primary: isDesign1 ?Colors.white:Color(0xFF1F4C6B), // Background color
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0), // Corner radius
                                  ),
                                ),
                                child: Text(
                                  'انشاء حساب',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: isDesign1 ?Color(0xFF1F4C6B): Colors.white,
                                    fontSize: 15,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,
                                    height: 0.09,
                                    letterSpacing: -0.24,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      )
                  )
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                isDesign1
                    ? login_screen()
                    : signup_screen(),
              ],
            )
          ],
        ),
      ),
    );
  }
}