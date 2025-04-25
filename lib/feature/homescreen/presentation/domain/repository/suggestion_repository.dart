import 'package:zoober_user_ride/feature/homescreen/presentation/domain/entity/suggestion_entity.dart';

abstract class SuggestionRepository {
  Future<List<SuggestionEntity>> fetchSuggestions();
}
