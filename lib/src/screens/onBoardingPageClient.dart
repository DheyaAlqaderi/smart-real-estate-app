import 'package:flutter/material.dart';

class OnBoardingClient extends StatefulWidget {
  const OnBoardingClient({super.key});

  @override
  State<OnBoardingClient> createState() => _OnBoardingClientState();
}

class _OnBoardingClientState extends State<OnBoardingClient> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(
      //   leading: Container(
      //     width: 90,
      //     height: 38,
      //     child: ElevatedButton(
      //         onPressed: (){},
      //         style: ElevatedButton.styleFrom(
      //         backgroundColor: Color(0xFF1F4C6B),
      //            shape: RoundedRectangleBorder(
      //             borderRadius: BorderRadius.circular(30.0), // Corner radius
      //     ),
      //     ), child: Text("تخطي"),
      //   ),
      // ),
      ),
      body: Container(

      ),
    );
  }
}
