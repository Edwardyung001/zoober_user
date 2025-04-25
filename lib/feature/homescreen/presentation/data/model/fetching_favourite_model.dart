class FavouriteItem {
  final int id;
  final String title;
  final String description;
  final String? deletedAt;

  FavouriteItem({
    required this.id,
    required this.title,
    required this.description,
    this.deletedAt,
  });

  factory FavouriteItem.fromJson(Map<String, dynamic> json) {
    return FavouriteItem(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      deletedAt: json['deleted_at'],
    );
  }
}

class FetchingFavouriteModel {
  final bool status;
  final List<FavouriteItem> favouriteList;

  FetchingFavouriteModel({
    required this.status,
    required this.favouriteList,
  });

  factory FetchingFavouriteModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'] as List<dynamic>? ?? [];

    return FetchingFavouriteModel(
      status: json['success'] == true,
      favouriteList: data.map((item) => FavouriteItem.fromJson(item)).toList(),
    );
  }
}
