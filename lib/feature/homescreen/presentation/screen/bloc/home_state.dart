part of 'home_bloc.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class FavouriteSuccess extends HomeState {
  final String message;
  FavouriteSuccess(this.message);
}


class UpdateProfileSuccess extends HomeState {
  final String message;
  UpdateProfileSuccess(this.message);
}

class FetchingProfileSuccess extends HomeState {
  final List<Map<String, dynamic>> userDetails;
  FetchingProfileSuccess(this.userDetails);
}


class FetchingFavouriteSuccess extends HomeState {
  final List<Map<String, dynamic>> favouriteList;

  FetchingFavouriteSuccess(this.favouriteList);
}

class FetchingSuggestionSuccess extends HomeState {
  final List<Map<String, dynamic>> suggestionList;

  FetchingSuggestionSuccess(this.suggestionList);
}


class HomeFailure extends HomeState {
  final String error;
  HomeFailure(this.error);
}
