class LoginModel {
  final bool success;
  final String message;
  final String name;
  final String token;
  final int userId;

  LoginModel({
    required this.success,
    required this.message,
    required this.name,
    required this.token,
    required this.userId,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    final bool success = json['success'] ?? false;
    final String message = json['message'] ?? '';

    if (!success) {
      // Return with only success and message
      return LoginModel(
        success: success,
        message: message,
        name: '',
        token: '',
        userId: 0,
      );
    }

    // When success is true, parse full data
    final user = json['user'];
    return LoginModel(
      success: success,
      message: message,
      name: user != null ? user['firstName'] ?? '' : '',
      token: json['token'] ?? '',
      userId: user != null ? user['id'] ?? 0 : 0,
    );
  }
}
