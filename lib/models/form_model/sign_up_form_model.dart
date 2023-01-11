class SignUpFormModel {
  final String? name;
  final String? username;
  final String? email;
  final String? password;

  SignUpFormModel({
    this.name,
    this.username,
    this.email,
    this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'username': username,
      'email': email,
      'password': password,
    };
  }
}
