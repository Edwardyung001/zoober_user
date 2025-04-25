import 'package:zoober_user_ride/core/network/api_connection.dart';
import 'package:zoober_user_ride/core/network/api_routes.dart';
import 'package:zoober_user_ride/core/storage/local_storage.dart';

import '../model/delete_account_model.dart';

class DeleteAccountDatasource {
  final DioClient dioClient;

  DeleteAccountDatasource(this.dioClient);

  //post method
  Future<DeleteAccountModel> deleteAccount(String userId) async {
    String? token = await SecureStorage.getValue('token');

    final response = await dioClient.post(ApiRoutes.deleteAccount,{
      'userId': userId,
    } ,
        headers: {
          'Authorization': 'Bearer $token',
        });
    print(response.data);
    return DeleteAccountModel.fromJson(response.data);
  }
}