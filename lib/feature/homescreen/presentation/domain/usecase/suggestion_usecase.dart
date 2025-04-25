import 'package:zoober_user_ride/feature/homescreen/presentation/data/model/suggestion_model.dart';
import 'package:zoober_user_ride/feature/homescreen/presentation/domain/entity/suggestion_entity.dart';
import 'package:zoober_user_ride/feature/homescreen/presentation/domain/repository/suggestion_repository.dart';

class FetchSuggestionsUseCase {
  final SuggestionRepository repository;

  FetchSuggestionsUseCase(this.repository);

  Future<List<SuggestionEntity>> call() {
    return repository.fetchSuggestions();
  }
}
