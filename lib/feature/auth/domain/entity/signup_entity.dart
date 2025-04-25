
import 'package:zoober_user_ride/feature/auth/data/model/signup_model.dart';

class SignupEntity {
  final bool success;
  final String message;
  final SignupUserData? data;

  SignupEntity({
    required this.success,
    required this.message,
    this.data,
  });
}
