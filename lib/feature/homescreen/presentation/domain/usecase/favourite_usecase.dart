

import 'package:zoober_user_ride/feature/homescreen/presentation/domain/entity/favourite_entity.dart';
import 'package:zoober_user_ride/feature/homescreen/presentation/domain/repository/favourite_repository.dart';

class FavouriteUseCase {
  final FavouriteRepository repository;

  FavouriteUseCase(this.repository);

  Future<FavouriteEntity> call(String title,String description) async {
    return await repository.favouriteList( title, description) ;
    }

}