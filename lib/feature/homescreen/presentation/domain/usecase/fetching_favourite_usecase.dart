
import 'package:zoober_user_ride/feature/homescreen/presentation/domain/entity/fetching_favourite_entity.dart';
import 'package:zoober_user_ride/feature/homescreen/presentation/domain/repository/fetching_favourite_repository.dart';

class FetchingFavouriteUseCase {
  final FetchingFavouriteRepository repository;

  FetchingFavouriteUseCase(this.repository);

  Future<FetchingFavouriteEntity> call(String userId) async {
    return await repository.favouriteFetching(userId);
    }

}