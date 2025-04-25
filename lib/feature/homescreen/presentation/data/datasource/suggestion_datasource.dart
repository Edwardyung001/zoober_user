
import 'package:zoober_user_ride/core/network/api_connection.dart';
import 'package:zoober_user_ride/core/network/api_routes.dart';
import 'package:zoober_user_ride/core/storage/local_storage.dart';
import 'package:zoober_user_ride/feature/homescreen/presentation/data/model/suggestion_model.dart';

class SuggestionDatasource {
  final DioClient dioClient;

  SuggestionDatasource(this.dioClient);

  //post method
  Future<FetchingSuggestionModel> suggestionList() async {
    String? token = await SecureStorage.getValue('token');

    final response = await dioClient.get(ApiRoutes.suggestion,
        headers: {
          'Authorization': 'Bearer $token',
        });
    print(response.data);
    return FetchingSuggestionModel.fromJson(response.data);
  }
}