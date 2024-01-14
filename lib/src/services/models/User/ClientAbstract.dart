import 'package:smart_real_estate_app/src/services/models/User/PersonAbastract.dart';

abstract class Client extends Person {
  String clientSpecificAttribute;

  Client({
    required String userName,
    required String phoneNumber,
    required String email,
    required String password,
    required this.clientSpecificAttribute,
  }) : super(
    userName: userName,
    phoneNumber: phoneNumber,
    email: email,
    password: password,
  );

}