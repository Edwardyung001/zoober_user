
import 'package:zoober_user_ride/feature/auth/data/datasource/signup_datasource.dart';
import 'package:zoober_user_ride/feature/auth/domain/entity/signup_entity.dart';
import 'package:zoober_user_ride/feature/auth/domain/repository/signup_repository.dart';

class SignupRepositoryImpl implements SignupRepository {
  final SignupDatasource datasource;

  SignupRepositoryImpl(this.datasource);

  @override
  Future<SignupEntity> signUp(String email,String mobileNumber,String firstName,String lastName,String gender,String dob, String password) async {
    final model = await datasource.signUp( email, mobileNumber,firstName,lastName,gender,dob,password);
    return model; // Already a SignupModel which extends SignupEntity
  }
}