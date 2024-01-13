class User {
  final String name;
  final String phone;
  final String email;
  final String password; // Note: In a production scenario, passwords should be
                         // stored securely and hashed.

  User({
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'] ?? '',
      phone: json['phone'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
      'password': password,
    };
  }
}
