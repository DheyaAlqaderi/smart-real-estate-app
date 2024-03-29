import 'package:smart_real_estate_app/src/services/models/User/user_return_value.dart';

abstract class Person {
  String userName;
  String phoneNumber;
  String email;
  String password;

  Person({
    required this.userName,
    required this.phoneNumber,
    required this.email,
    required this.password,
  });

  // Operations
  Future<User?> createAccount(String userName, String phoneNumber, String email, String password);
  Future<String?> login(String userName, String password);
  void logout();
  void forgotEmailPassword(String email, String token);
  void search();
  void makeItMyFavorite();
  void giveFeedback();
  void sendMessage();
  void getMessage();
  void setAlarm();
}

