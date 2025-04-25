import 'package:zoober_user_ride/feature/homescreen/presentation/data/datasource/suggestion_datasource.dart';
import 'package:zoober_user_ride/feature/homescreen/presentation/data/model/suggestion_model.dart';

import 'package:zoober_user_ride/feature/homescreen/presentation/data/datasource/suggestion_datasource.dart';
import 'package:zoober_user_ride/feature/homescreen/presentation/domain/entity/suggestion_entity.dart';
import 'package:zoober_user_ride/feature/homescreen/presentation/domain/repository/suggestion_repository.dart';

class SuggestionRepositoryImpl implements SuggestionRepository {
  final SuggestionDatasource datasource;

  SuggestionRepositoryImpl(this.datasource);

  @override
  Future<List<SuggestionEntity>> fetchSuggestions() async {
    final model = await datasource.suggestionList();

    return model.suggestionList.map((item) => SuggestionEntity(
      id: item.id,       // title in model is actually ID
      name: item.name, // description is name in model
    )).toList();
  }
}
