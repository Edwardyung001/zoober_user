import 'package:zoober_user_ride/feature/auth/domain/entity/signup_entity.dart';

abstract class SignupRepository {
  Future<SignupEntity> signUp(String email,String mobileNumber, String firstName,String lastName,String gender,String dob,String password, );
}