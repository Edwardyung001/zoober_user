import 'package:zoober_user_ride/core/network/api_connection.dart';
import 'package:zoober_user_ride/core/network/api_routes.dart';
import 'package:zoober_user_ride/core/storage/local_storage.dart';
import 'package:zoober_user_ride/feature/homescreen/presentation/data/model/favourite_model.dart';

class FavouriteDatasource {
  final DioClient dioClient;

  FavouriteDatasource(this.dioClient);

  //post method
  Future<FavouriteModel> favouriteList(String title, String description) async {
    String? token = await SecureStorage.getValue('token');
    String? userId = await SecureStorage.getValue('userId');
    final inputData = {
      'userId': userId,
      'title': title,
      'description': description,
    };
    print(inputData);
    final response = await dioClient.post(
      ApiRoutes.favouriteList,
      {'userId': userId, 'title': title, 'description': description},
      headers: {'Authorization': 'Bearer $token'},
    );
    print(response.data);
    return FavouriteModel.fromJson(response.data);
  }
}
