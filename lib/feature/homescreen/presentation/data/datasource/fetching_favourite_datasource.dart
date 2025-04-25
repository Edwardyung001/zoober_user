
import 'package:zoober_user_ride/core/network/api_connection.dart';
import 'package:zoober_user_ride/core/network/api_routes.dart';
import 'package:zoober_user_ride/core/storage/local_storage.dart';
import 'package:zoober_user_ride/feature/homescreen/presentation/data/model/fetching_favourite_model.dart';

class FetchingFavouriteDatasource {
  final DioClient dioClient;

  FetchingFavouriteDatasource(this.dioClient);

  //post method
  Future<FetchingFavouriteModel> favouriteFetching(String userId,) async {
    String? token = await SecureStorage.getValue('token');
    String? userId = await SecureStorage.getValue('userId');

    final input={
      'userId':userId,
    };
    print(input);
    final response = await dioClient.post(ApiRoutes.favouriteFetching, {
      'userId': userId,
    },
        headers: {
          'Authorization': 'Bearer $token',
        });
    print(response.data);
    return FetchingFavouriteModel.fromJson(response.data);
  }
}