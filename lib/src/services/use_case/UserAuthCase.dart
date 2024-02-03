import 'package:flutter/material.dart';
import 'package:smart_real_estate_app/src/services/repository/ClientAuthRepository.dart';
import 'package:smart_real_estate_app/src/ui/screens/root_pages.dart';
import '../localdb/Managedb.dart';
import '../models/User/user_return_value.dart';


class UserAuthCase {
  final ClientAuthRepository _authRepository = ClientAuthRepository();
  bool isLoading = false;
  VoidCallback? _loadingStateChangedCallback;

  void setOnLoadingStateChanged(VoidCallback callback) {
    _loadingStateChangedCallback = callback;
  }

  Future<void> login(BuildContext context, String username, String password) async {
    try {
      // Set loading to true to show the progress indicator
      isLoading = true;

      // Notify the UI that the loading state has changed
      _notifyLoadingStateChanged();

      final String? token = await _authRepository.login(username, password);

      if (token != null) {
        // Handle successful login, e.g., save token and navigate to the homePage screen
        // Save the token to the local database
        await Managedb.saveToken(token);

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => root_pages()),
        );
      } else {
        // Handle authentication failure, e.g., show error message to the user
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Authentication failed'),
          ),
        );
      }
    } finally {
      // Set loading to false after the operation (success or failure)
      isLoading = false;

      // Notify the UI that the loading state has changed
      _notifyLoadingStateChanged();
    }
  }

  Future<void> createAccount(
      BuildContext context,
      String userName,
      String phoneNumber,
      String email,
      String password) async {
    try {
      // Set loading to true to show the progress indicator
      isLoading = true;

      // Notify the UI that the loading state has changed
      _notifyLoadingStateChanged();

      final User? user = await _authRepository.createAccount(userName, phoneNumber, email, password);

      if (user != null) {
        // Handle successful create, e.g., save token and navigate to the homePage screen
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('created successfully'),
          ),
        );
        // final String? token = await _authRepository.login(userName, password);
        // if(token!=null){
        //   Navigator.push(
        //     context,
        //     MaterialPageRoute(builder: (context) => root_pages()),
        //   );
        // } else {
        //   // Handle authentication failure, e.g., show error message to the user
        //   ScaffoldMessenger.of(context).showSnackBar(
        //     SnackBar(
        //       content: Text('Authentication failed'),
        //     ),
        //   );
        // }

      } else {
        // Handle authentication failure, e.g., show error message to the user
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Authentication failed'),
          ),
        );
      }
    } finally {
      // Set loading to false after the operation (success or failure)
      isLoading = false;

      // Notify the UI that the loading state has changed
      _notifyLoadingStateChanged();
    }
  }

  void _notifyLoadingStateChanged() {
    if (_loadingStateChangedCallback != null) {
      _loadingStateChangedCallback!();
    }
  }
}


