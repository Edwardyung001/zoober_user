
import 'package:zoober_user_ride/feature/homescreen/presentation/domain/entity/fetching_favourite_entity.dart';

abstract class FetchingFavouriteRepository {
  Future<FetchingFavouriteEntity> favouriteFetching(String userId);
}