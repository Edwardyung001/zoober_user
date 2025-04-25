class DeleteFavouriteModel{
  final bool success;
  final String message;


  DeleteFavouriteModel({
    required this.success,
    required this.message,
  });

  factory DeleteFavouriteModel.fromJson(Map<String, dynamic> json) {
    return DeleteFavouriteModel(
      success: json['success'] == true,
      message: json['message'],
    );
  }
}