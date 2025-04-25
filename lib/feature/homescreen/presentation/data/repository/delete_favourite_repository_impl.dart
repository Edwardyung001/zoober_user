import 'package:zoober_user_ride/feature/homescreen/presentation/data/datasource/delete_favourite_datasource.dart';
import 'package:zoober_user_ride/feature/homescreen/presentation/data/model/delete_favourite_model.dart';
import 'package:zoober_user_ride/feature/homescreen/presentation/domain/entity/delete_favourite_entity.dart';
import 'package:zoober_user_ride/feature/homescreen/presentation/domain/repository/delete_favourite_repository.dart';

class DeleteFavouriteRepositoryImpl implements DeleteFavouriteRepository {
  final DeleteFavouriteDatasource deleteFavouriteDatasource;

  DeleteFavouriteRepositoryImpl( this.deleteFavouriteDatasource);

  @override
  Future<DeleteFavouriteEntity> deleteFavourite(int id) async {
    final DeleteFavouriteModel deleteFavouriteModel = await deleteFavouriteDatasource.deleteFavourite(id);

    return DeleteFavouriteEntity(
      message: deleteFavouriteModel.message,);
  }
}