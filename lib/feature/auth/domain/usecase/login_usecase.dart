

import 'package:zoober_user_ride/feature/auth/domain/entity/login_entity.dart';
import 'package:zoober_user_ride/feature/auth/domain/repository/login_repository.dart';

class LoginUseCase {
  final LoginRepository repository;

  LoginUseCase(this.repository);

  Future<LoginEntity> call(String phoneNumber, String password) {
    return repository.login(phoneNumber,password);
  }
}