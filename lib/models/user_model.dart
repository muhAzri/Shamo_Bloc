class UserModel {
  final int? id;
  final String? name;
  final String? email;
  final String? username;
  final String? password;
  final String? profilePicture;
  final String? token;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.username,
    this.password,
    this.profilePicture,
    this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      id: json['data']['user']['id'],
      name: json['data']['user']['name'],
      email: json['data']['user']['email'],
      username: json['data']['user']['username'],
      profilePicture: json['data']['user']['profile_photo_url'],
      token: json['data']['access_token']);
}
