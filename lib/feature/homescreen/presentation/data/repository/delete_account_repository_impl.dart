import '../../domain/entity/delete_account_entity.dart';
import '../../domain/repository/delete_account_repository.dart';
import '../datasource/delete_account_datasource.dart';
import '../model/delete_account_model.dart';

class DeleteAccountRepositoryImpl implements DeleteAccountRepository {
  final DeleteAccountDatasource deleteAccountDatasource;

  DeleteAccountRepositoryImpl( this.deleteAccountDatasource);

  @override
  Future<DeleteAccountEntity> deleteAccount(String userId) async {
    final DeleteAccountModel deleteAccountModel = await deleteAccountDatasource.deleteAccount(userId);

    return DeleteAccountEntity(
      message: deleteAccountModel.message,);
  }
}