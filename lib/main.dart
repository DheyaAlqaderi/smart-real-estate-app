import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_real_estate_app/src/ui/screens/SplashScreen.dart';
import 'package:smart_real_estate_app/src/ui/screens/propertyDetailsPage.dart';
import 'package:smart_real_estate_app/src/ui/screens/root_pages.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: root_pages(),
    );
  }
}