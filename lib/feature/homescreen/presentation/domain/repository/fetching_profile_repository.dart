
import 'package:zoober_user_ride/feature/homescreen/presentation/domain/entity/fetching_profile_entity.dart';

abstract class FetchingProfileRepository {
  Future<FetchingProfileEntity> profileFetching(String userId);
}