import 'package:zoober_user_ride/feature/homescreen/presentation/domain/entity/delete_favourite_entity.dart';
import 'package:zoober_user_ride/feature/homescreen/presentation/domain/repository/delete_favourite_repository.dart';

class DeleteFavouriteUseCase {
  final DeleteFavouriteRepository repository;

  DeleteFavouriteUseCase(this.repository);

  Future<DeleteFavouriteEntity> call(int id) async {
    return await repository.deleteFavourite(id);
  }
}
