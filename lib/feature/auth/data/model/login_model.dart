class LoginModel {
  final bool success;
  final String message;
  final String token;
  final int userId;

  LoginModel({
    required this.success,
    required this.message,
    required this.token,
    required this.userId,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      success: json['success']??false ,
      message: json['message'],
      token: json['token'],
      userId: json['user']['id'],

    );
  }
}
