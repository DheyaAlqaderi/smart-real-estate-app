import 'package:smart_real_estate_app/src/services/models/User/PersonAbastract.dart';

abstract class Client extends Person {

  Client({
    required String userName,
    required String phoneNumber,
    required String email,
    required String password,
  }) : super(
    userName: userName,
    phoneNumber: phoneNumber,
    email: email,
    password: password,
  );

}