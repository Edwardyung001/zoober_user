class FetchingProfileModel{
  final bool status;
  final List<Map<String, dynamic>> userDetails;



  FetchingProfileModel({
    required this.status,
    required this.userDetails,
  });

  factory FetchingProfileModel.fromJson(Map<String, dynamic> json) {
    final user = json['user'] as Map<String, dynamic>?;

    return FetchingProfileModel(
      status: json['success'] == true,
      userDetails: [
        {
          "firstname": user?['firstname'] ?? 'dsf',
          "lastname": user?['lastname'] ?? '',
          "profile": user?['profile'] ?? '',
          "mobile": user?['mobile'] ?? '',
          "email": user?['email'] ?? '',
          "gender": user?['gender'] ?? '',
          "dob": user?['dob'] ?? '',
        }
      ],
    );
  }

}