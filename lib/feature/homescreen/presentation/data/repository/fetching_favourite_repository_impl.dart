
import 'package:zoober_user_ride/feature/homescreen/presentation/data/datasource/fetching_favourite_datasource.dart';
import 'package:zoober_user_ride/feature/homescreen/presentation/data/model/fetching_favourite_model.dart';
import 'package:zoober_user_ride/feature/homescreen/presentation/domain/entity/fetching_favourite_entity.dart';
import 'package:zoober_user_ride/feature/homescreen/presentation/domain/repository/fetching_favourite_repository.dart';

class FetchingFavouriteRepositoryImpl implements FetchingFavouriteRepository {
final FetchingFavouriteDatasource fetchingFavouriteDatasource;

FetchingFavouriteRepositoryImpl( this.fetchingFavouriteDatasource);

@override
Future<FetchingFavouriteEntity> favouriteFetching(String userId) async {
  final FetchingFavouriteModel fetchingFavouriteModel = await fetchingFavouriteDatasource.favouriteFetching(userId);

  return FetchingFavouriteEntity(
    favouriteList: fetchingFavouriteModel.favouriteList,);
  }
}