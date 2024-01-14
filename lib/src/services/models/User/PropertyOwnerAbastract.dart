import 'package:smart_real_estate_app/src/services/models/User/PersonAbastract.dart';

abstract class PropertyOwner extends Person {
  String profileImage;
  String type;
  String idNumber;

  PropertyOwner({
    required String userName,
    required String phoneNumber,
    required String email,
    required String password,
    required this.profileImage,
    required this.type,
    required this.idNumber,

  }) : super(
    userName: userName,
    phoneNumber: phoneNumber,
    email: email,
    password: password,
  );

  void addProperty();
  void editProperty();
  void deleteProperty();
  void getOptimizePrice();
  void manageProfile();
}