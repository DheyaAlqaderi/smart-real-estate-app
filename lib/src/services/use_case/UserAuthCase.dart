import 'package:flutter/material.dart';
import 'package:smart_real_estate_app/src/services/repository/ClientAuthRepository.dart';
import '../../ui/screens/homePage.dart';
import '../localdb/Managedb.dart';

class UserAuthCase {
  final ClientAuthRepository _authRepository = ClientAuthRepository();

  Future<void> login(BuildContext context, String username, String password) async {
    final String? token = await _authRepository.login(username, password);

    if (token != null) {
      // Handle successful login, e.g., save token and navigate to the homePage screen
      // Save the token to the local database
      await Managedb.saveToken(token);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => homePage()),
      );
    } else {
      // Handle authentication failure, e.g., show error message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Authentication failed'),
        ),
      );
    }
  }
}
