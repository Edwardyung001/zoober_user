

import 'package:zoober_user_ride/core/network/api_connection.dart';
import 'package:zoober_user_ride/core/network/api_routes.dart';
import 'package:zoober_user_ride/feature/auth/data/model/signup_model.dart';

class SignupDatasource {
  final DioClient dioClient;

  SignupDatasource(this.dioClient);

  Future<SignupModel> signUp(String email, String mobileNumber,String firstName,String lastName,String gender,String dob,String password) async {
    try {
      final response = await dioClient.post(
        ApiRoutes.signUp,
        {'email': email,
          'mobile':mobileNumber,
          'firstname':firstName,
        'lastname':lastName,
          'gender':gender,
          'dob':dob,
          'password': password,},
      );
      return SignupModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Error fetching role-based data: $e');
    }
  }
}