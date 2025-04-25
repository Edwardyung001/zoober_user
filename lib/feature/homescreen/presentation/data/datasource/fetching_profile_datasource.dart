
import 'package:zoober_user_ride/core/network/api_connection.dart';
import 'package:zoober_user_ride/core/network/api_routes.dart';
import 'package:zoober_user_ride/core/storage/local_storage.dart';
import 'package:zoober_user_ride/feature/homescreen/presentation/data/model/fetching_profile_model.dart';

class FetchingProfileDatasource {
  final DioClient dioClient;

  FetchingProfileDatasource(this.dioClient);

  //post method
  Future<FetchingProfileModel> profileFetching(String userId,) async {
    String? token = await SecureStorage.getValue('token');

    final input={
      'userId':userId,
    };
    print(input);
    final response = await dioClient.post(ApiRoutes.profileFetching, {
      'userId': userId,
    },
        headers: {
          'Authorization': 'Bearer $token',
        });
    print(response.data);
    return FetchingProfileModel.fromJson(response.data);
  }
}