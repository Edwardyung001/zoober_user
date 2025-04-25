class UpdateProfileModel{
  final bool success;
  final String message;


  UpdateProfileModel({
    required this.success,
    required this.message,
  });

  factory UpdateProfileModel.fromJson(Map<String, dynamic> json) {
    return UpdateProfileModel(
    success: json['success']?? false,
      message: json['message'],
    );
  }
}