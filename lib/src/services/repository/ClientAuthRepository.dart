import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:smart_real_estate_app/src/services/models/User/ClientAbstract.dart';

class ClientAuthRepository extends Client {
  ClientAuthRepository({
    String? userName,
    String? phoneNumber,
    String? email,
    String? password,
  }) : super(userName: '', phoneNumber: '', email: '', password: '');

  @override
  Future<String?> login(String userName, String password) async {

    final String _apiUrl = 'http://192.168.0.193:8005/api/auth/login/';
    try {
      final response = await http.post(
        Uri.parse(_apiUrl),
        body: {
          "username": userName,
          "password": password,
        },
      );

      if(response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final String token = data["token"];

        return token;
      } else {
        return null;
      }
    } catch (error) {
      print('Error: $error');
      return null;
    }
  }

  @override
  void createAccount(String userName, String phoneNumber, String email, String password) {
    // TODO: implement createAccount
  }

  @override
  void forgotEmailPassword(String email, String token) {
    // TODO: implement forgotEmailPassword
  }

  @override
  void getMessage() {
    // TODO: implement getMessage
  }

  @override
  void giveFeedback() {
    // TODO: implement giveFeedback
  }

  @override
  void logout() {
    // TODO: implement logout
  }

  @override
  void makeItMyFavorite() {
    // TODO: implement makeItMyFavorite
  }

  @override
  void search() {
    // TODO: implement search
  }

  @override
  void sendMessage() {
    // TODO: implement sendMessage
  }

  @override
  void setAlarm() {
    // TODO: implement setAlarm
  }


}