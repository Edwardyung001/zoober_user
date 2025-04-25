


import 'package:zoober_user_ride/feature/homescreen/presentation/data/datasource/fetching_profile_datasource.dart';
import 'package:zoober_user_ride/feature/homescreen/presentation/data/model/fetching_profile_model.dart';
import 'package:zoober_user_ride/feature/homescreen/presentation/domain/entity/fetching_profile_entity.dart';
import 'package:zoober_user_ride/feature/homescreen/presentation/domain/repository/fetching_profile_repository.dart';

class FetchingProfileRepositoryImpl implements FetchingProfileRepository {
final FetchingProfileDatasource fetchingProfileDatasource;

FetchingProfileRepositoryImpl( this.fetchingProfileDatasource);

@override
Future<FetchingProfileEntity> profileFetching(String userId) async {
  final FetchingProfileModel fetchingProfileModel = await fetchingProfileDatasource.profileFetching(userId);

  return FetchingProfileEntity(
    userDetails: fetchingProfileModel.userDetails,);
  }
}