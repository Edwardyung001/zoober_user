class SuggestionModel {
  final int id;
  final String name;

  SuggestionModel({
    required this.id,
    required this.name,
  });

  factory SuggestionModel.fromJson(Map<String, dynamic> json) {
    return SuggestionModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
    );
  }
}

class FetchingSuggestionModel {
  final bool status;
  final List<SuggestionModel> suggestionList;

  FetchingSuggestionModel({
    required this.status,
    required this.suggestionList,
  });

  factory FetchingSuggestionModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'] as List<dynamic>? ?? [];

    return FetchingSuggestionModel(
      status: json['success'] == true,
      suggestionList: data.map((item) => SuggestionModel.fromJson(item)).toList(),
    );
  }
}
