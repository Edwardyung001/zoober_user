class FavouriteModel{
  final bool status;
  final String message;


  FavouriteModel({
    required this.status,
    required this.message,
  });

  factory FavouriteModel.fromJson(Map<String, dynamic> json) {
    return FavouriteModel(
        status: json['success'] == true,
        message: json['message'],
        );
  }
}