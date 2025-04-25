import 'package:zoober_user_ride/feature/homescreen/presentation/domain/entity/delete_favourite_entity.dart';

abstract class DeleteFavouriteRepository {
  Future<DeleteFavouriteEntity> deleteFavourite(int id);
}