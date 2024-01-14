import 'package:flutter/material.dart';
import 'package:smart_real_estate_app/src/services/localdb/Managedb.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.amber[200],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder<String?>(
            future: Managedb.getToken(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                final String? retrievedToken = snapshot.data;
                return Center(child: Text('Your Token ياغالي  :\n ${retrievedToken ?? "No token available"}'));
              }
            },
          ),
        ],
      ),
    );
  }
}
