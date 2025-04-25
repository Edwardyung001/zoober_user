import 'package:zoober_user_ride/feature/homescreen/presentation/domain/entity/delete_account_entity.dart';
import 'package:zoober_user_ride/feature/homescreen/presentation/domain/repository/delete_account_repository.dart';

class DeleteAccountUseCase {
  final DeleteAccountRepository repository;

  DeleteAccountUseCase(this.repository);

  Future<DeleteAccountEntity> call(String userId) async {
    return await repository.deleteAccount(userId);
  }
}