class UserModel {
  final String token;
  final String message;

  UserModel({required this.token, required this.message});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      token: json['token'] ?? '',
      message: json['message'] ?? '',
    );
  }
}
