
import 'package:zoober_user_ride/core/network/api_connection.dart';
import 'package:zoober_user_ride/core/network/api_routes.dart';
import 'package:zoober_user_ride/core/storage/local_storage.dart';
import 'package:zoober_user_ride/feature/homescreen/presentation/data/model/delete_favourite_model.dart';

class DeleteFavouriteDatasource {
  final DioClient dioClient;

  DeleteFavouriteDatasource(this.dioClient);

  //post method
  Future<DeleteFavouriteModel> deleteFavourite(int id) async {
    String? token = await SecureStorage.getValue('token');

    final input={
      'id':id,
    };
    print(input);
    final response = await dioClient.post(ApiRoutes.deleteFavourite, {
      'id': id,
    },
        headers: {
          'Authorization': 'Bearer $token',
        });
    print(response.data);
    return DeleteFavouriteModel.fromJson(response.data);
  }
}