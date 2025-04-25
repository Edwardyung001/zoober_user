
import 'package:zoober_user_ride/feature/homescreen/presentation/domain/entity/fetching_profile_entity.dart';
import 'package:zoober_user_ride/feature/homescreen/presentation/domain/repository/fetching_profile_repository.dart';

class FetchingProfileUseCase {
  final FetchingProfileRepository repository;

  FetchingProfileUseCase(this.repository);

  Future<FetchingProfileEntity> call(String userId) async {
    return await repository.profileFetching( userId) ;
    }

}