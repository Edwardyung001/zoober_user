import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoober_user_ride/feature/homescreen/presentation/data/model/suggestion_model.dart';
import 'package:zoober_user_ride/feature/homescreen/presentation/domain/usecase/delete_account_usecase.dart';
import 'package:zoober_user_ride/feature/homescreen/presentation/domain/usecase/delete_favourite_usecase.dart';
import 'package:zoober_user_ride/feature/homescreen/presentation/domain/usecase/favourite_usecase.dart';
import 'package:zoober_user_ride/feature/homescreen/presentation/domain/usecase/fetching_favourite_usecase.dart';
import 'package:zoober_user_ride/feature/homescreen/presentation/domain/usecase/fetching_profile_usecase.dart';
import 'package:zoober_user_ride/feature/homescreen/presentation/domain/usecase/suggestion_usecase.dart';
import 'package:zoober_user_ride/feature/homescreen/presentation/domain/usecase/update_profile_usecase.dart';
part 'home_state.dart';
part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final FavouriteUseCase favouriteUseCase;
  final UpdateProfileUseCase updateProfileUseCase;
  final FetchingProfileUseCase fetchingProfileUseCase;
  final FetchingFavouriteUseCase fetchingFavouriteUseCase;
  final FetchSuggestionsUseCase fetchSuggestionsUseCase;
  final DeleteFavouriteUseCase deleteFavouriteUseCase;
  final DeleteAccountUseCase deleteAccountUseCase;

  HomeBloc(this.favouriteUseCase, this.updateProfileUseCase,
      this.fetchingProfileUseCase, this.fetchingFavouriteUseCase,this.fetchSuggestionsUseCase,this.deleteFavouriteUseCase,this.deleteAccountUseCase)
      : super(HomeInitial()) {


    on<AddFavouriteListRequested>((event, emit) async {
      emit(HomeLoading());
      try {
        final response = await favouriteUseCase(
          event.title,
          event.description,
        );
        emit(FavouriteSuccess(response.message));
      } catch (e) {
        emit(HomeFailure(e.toString()));
      }
    });


    on<FirstProfileRequested>((event, emit) async {
      emit(HomeLoading());
      try {
        final response = await updateProfileUseCase(
          userId: event.userId,
          firstname: event.firstName,
          lastname: event.lastName,
          // You can add more if needed
        );
        emit(UpdateProfileSuccess(response.message));
      } catch (e) {
        emit(HomeFailure(e.toString()));
      }
    });
    on<MobileProfileRequested>((event, emit) async {
      emit(HomeLoading());
      try {
        final response = await updateProfileUseCase(
          userId: event.userId,
          mobile: event.mobile,
          // You can add more if needed
        );
        emit(UpdateProfileSuccess(response.message));
      } catch (e) {
        emit(HomeFailure(e.toString()));
      }
    });



    on<EmailProfileRequested>((event, emit) async {
      emit(HomeLoading());
      try {
        final response = await updateProfileUseCase(
          userId: event.userId,
          email: event.email,
          // You can add more if needed
        );
        emit(UpdateProfileSuccess(response.message));
      } catch (e) {
        emit(HomeFailure(e.toString()));
      }
    });

    on<ProfileImageRequested>((event, emit) async {
      emit(HomeLoading());
      try {
        final response = await updateProfileUseCase(
          userId: event.userId,
          image: event.image,
          // You can add more if needed
        );
        emit(UpdateProfileSuccess(response.message));
      } catch (e) {
        emit(HomeFailure(e.toString()));
      }
    });



    on<GenderProfileRequested>((event, emit) async {
      emit(HomeLoading());
      try {
        final response = await updateProfileUseCase(
          userId: event.userId,
          gender: event.gender,
          // You can add more if needed
        );
        emit(UpdateProfileSuccess(response.message));
      } catch (e) {
        emit(HomeFailure(e.toString()));
      }
    });

    on<FetchingProfileRequested>((event, emit) async {
      emit(HomeLoading());
      try {
        final response = await fetchingProfileUseCase(event.userId);
        emit(FetchingProfileSuccess(response.userDetails));
      } catch (e) {
        emit(HomeFailure(e.toString()));
      }
    });


    on<FetchingFavouriteRequested>((event, emit) async {
      emit(HomeLoading());
      try {
        final response = await fetchingFavouriteUseCase(event.userId);

        // Convert List<FavouriteItem> to List<Map<String, dynamic>>
        final favouriteList = response.favouriteList.map((item) => {
          'id':item.id,
          'title': item.title,
          'description': item.description,
          'deleted_at': item.deletedAt,
        }).toList();

        emit(FetchingFavouriteSuccess(favouriteList));
      } catch (e) {
        emit(HomeFailure(e.toString()));
      }
    });

    on<FetchingSuggestionRequested>((event, emit) async {
      emit(HomeLoading());
      try {
        final response = await fetchSuggestionsUseCase(); // This returns List<SuggestionEntity>

        final suggestions = response.map((item) => {
          'id': item.id,          // id is stored as title in model
          'name': item.name,  // name is stored as description
        }).toList();

        emit(FetchingSuggestionSuccess(suggestions));
      } catch (e) {
        emit(HomeFailure(e.toString()));
      }
    });



    on<DeleteFavouriteRequested>((event, emit) async {
      emit(HomeLoading()); // Show loading indicator while deleting
      try {
        // Call the delete use case with the favourite id
        final response = await deleteFavouriteUseCase(
          event.id,
        );
        // Emit success state with a message
        emit(DeleteFavouriteSuccess(response.message)); // You can customize the response as needed
      } catch (e) {
        // If there is an error, emit failure state with error message
        emit(HomeFailure(e.toString()));
      }
    });

    on<DeleteAccountRequested>((event, emit) async {
      emit(HomeLoading()); // Show loading indicator while deleting
      try {
        // Call the delete use case with the favourite id
        final response = await deleteAccountUseCase(
          event.userId,
        );
        // Emit success state with a message
        emit(DeleteAccountSuccess(response.message)); // You can customize the response as needed
      } catch (e) {
        // If there is an error, emit failure state with error message
        emit(HomeFailure(e.toString()));
      }
    });


  }
}
