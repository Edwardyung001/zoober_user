import 'package:zoober_user_ride/feature/auth/domain/entity/login_entity.dart';

abstract class LoginRepository {
  Future<LoginEntity> login(String phoneNumber, String password, );
}