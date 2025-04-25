class DeleteAccountModel{
  final bool success;
  final String message;


  DeleteAccountModel({
    required this.success,
    required this.message,
  });

  factory DeleteAccountModel.fromJson(Map<String, dynamic> json) {
    return DeleteAccountModel(
      success: json['success'] == true,
      message: json['message'],
    );
  }
}