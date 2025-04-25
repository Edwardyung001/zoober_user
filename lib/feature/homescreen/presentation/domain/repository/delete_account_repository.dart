import 'package:zoober_user_ride/feature/homescreen/presentation/domain/entity/delete_account_entity.dart';

abstract class DeleteAccountRepository {
  Future<DeleteAccountEntity> deleteAccount(String userId);
}