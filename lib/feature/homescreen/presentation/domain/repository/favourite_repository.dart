
import 'package:zoober_user_ride/feature/homescreen/presentation/domain/entity/favourite_entity.dart';

abstract class FavouriteRepository {
  Future<FavouriteEntity> favouriteList(String title,String description);
}