class UserModel {
  final String? userId;
  final String? name;
  final String? email;
  // final String? password;
  final String? token;

  UserModel(
      {this.userId,
      this.email,
      // this.password,
      this.name,
      this.token});

  Map<String, dynamic> toJson() {
    return {
      'email': email, 'name': name, 'token': token
      // 'password': password
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        userId: json["userId"],
        email: json["email"],
        name: json["name"],
        // password: json["password"],
        token: json["token"]);
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'email': email,
      // 'password': password,
      'name': name,
      'token': token,
    };
  }

  @override
  String toString() {
    return 'UserModel{userId: $userId, email: $email, name: $name, token: $token}';
    // password: $password,
  }
}
