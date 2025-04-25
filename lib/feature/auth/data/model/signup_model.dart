
import 'package:zoober_user_ride/feature/auth/domain/entity/signup_entity.dart';

class SignupUserData {
  final int id;
  final String firstname;
  final String email;
  final String mobile;
  final String password;
  final String createdAt;
  final String updatedAt;

  SignupUserData({
    required this.id,
    required this.firstname,
    required this.email,
    required this.mobile,
    required this.password,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SignupUserData.fromJson(Map<String, dynamic> json) {
    return SignupUserData(
      id: json['id'],
      firstname: json['firstname'] ?? '',
      email: json['email'] ?? '',
      mobile: json['mobile'] ?? '',
      password: json['password'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstname': firstname,
      'email': email,
      'mobile': mobile,
      'password': password,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}

class SignupModel extends SignupEntity {
  SignupModel({
    required bool success,
    required String message,
    SignupUserData? data,
  }) : super(success: success, message: message, data: data);

  factory SignupModel.fromJson(Map<String, dynamic> json) {
    return SignupModel(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: json['data'] != null ? SignupUserData.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': data?.toJson(),
    };
  }
}
