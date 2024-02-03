class User {
  int id;
  String email;
  String phoneNumber;
  String username;
  String name;
  String image;
  UserAuth userAuth;

  User({
    required this.id,
    required this.email,
    required this.phoneNumber,
    required this.username,
    required this.name,
    required this.image,
    required this.userAuth,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      phoneNumber: json['phone_number'],
      username: json['username'],
      name: json['name'],
      image: json['image'],
      userAuth: UserAuth.fromJson(json['user_auth']),
    );
  }
}

class UserAuth {
  String additionalProp1;
  String additionalProp2;
  String additionalProp3;

  UserAuth({
    required this.additionalProp1,
    required this.additionalProp2,
    required this.additionalProp3,
  });

  factory UserAuth.fromJson(Map<String, dynamic> json) {
    return UserAuth(
      additionalProp1: json['additionalProp1'],
      additionalProp2: json['additionalProp2'],
      additionalProp3: json['additionalProp3'],
    );
  }
}
