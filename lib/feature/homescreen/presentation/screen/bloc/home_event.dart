part of 'home_bloc.dart';

abstract class HomeEvent {}

class AddFavouriteListRequested extends HomeEvent {
  final String title;
  final String description;

  AddFavouriteListRequested({
    required this.title,
    required this.description,
  });
}

class FetchingProfileRequested extends HomeEvent {
  final String userId;

  FetchingProfileRequested({
    required this.userId,
  });
}
class FetchingFavouriteRequested extends HomeEvent {
  final String userId;

  FetchingFavouriteRequested({
    required this.userId,
  });
}

class FetchingSuggestionRequested extends HomeEvent {}


class FirstProfileRequested extends HomeEvent {
  final String userId;
  final String firstName;
  final String lastName;

  FirstProfileRequested(
      {required this.userId, required this.firstName, required this.lastName});
}

class EmailProfileRequested extends HomeEvent {
  final String userId;
  final String email;

  EmailProfileRequested({
    required this.userId,
    required this.email,
  });
}

class MobileProfileRequested extends HomeEvent {
  final String userId;
  final String mobile;

  MobileProfileRequested({
    required this.mobile,
    required this.userId,
  });
}

class GenderProfileRequested extends HomeEvent {
  final String userId;

  final String gender;

  GenderProfileRequested({
    required this.userId,
    required this.gender,
  });
}

class DobProfileRequested extends HomeEvent {
  final String userId;
  final String dob;

  DobProfileRequested({
    required this.dob,
    required this.userId,
  });
}

class ImageProfileRequested extends HomeEvent {
  final String userId;
  final String image;

  ImageProfileRequested({
    required this.userId,
    required this.image,
  });
}
