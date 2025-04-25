
import 'package:zoober_user_ride/feature/homescreen/presentation/data/datasource/favourite_datasource.dart';
import 'package:zoober_user_ride/feature/homescreen/presentation/data/model/favourite_model.dart';
import 'package:zoober_user_ride/feature/homescreen/presentation/domain/entity/favourite_entity.dart';
import 'package:zoober_user_ride/feature/homescreen/presentation/domain/repository/favourite_repository.dart';

class FavouriteRepositoryImpl implements FavouriteRepository {
final FavouriteDatasource favouriteDatasource;

FavouriteRepositoryImpl( this.favouriteDatasource);

@override
Future<FavouriteEntity> favouriteList(String title,String description) async {
  final FavouriteModel favouriteModel = await favouriteDatasource.favouriteList(title,description);

  return FavouriteEntity(
      message: favouriteModel.message,);
  }
}