

import 'package:zoober_user_ride/feature/auth/domain/entity/signup_entity.dart';
import 'package:zoober_user_ride/feature/auth/domain/repository/signup_repository.dart';

class SignupUseCase {
  final SignupRepository repository;

  SignupUseCase(this.repository);

  Future<SignupEntity> call(String email, String mobileNumber, String firstName,String lastName,String gender,String dob,String password) {
    return repository.signUp( email,mobileNumber,firstName,lastName,gender,dob,password);
  }
}