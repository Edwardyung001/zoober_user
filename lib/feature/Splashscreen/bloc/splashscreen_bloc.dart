import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoober_user_ride/core/storage/local_storage.dart';

part 'splashscreen_event.dart';
part 'splashscreen_state.dart';

class SplashscreenBloc extends Bloc<SplashscreenEvent, SplashscreenState> {
  SplashscreenBloc() : super(SplashscreenInitial()) {
    on<SplashScreenRountingEvent>(splashScreenRountingEvent);
  }

  Future<void> splashScreenRountingEvent(
      SplashScreenRountingEvent event, Emitter<SplashscreenState> emit) async {
    await Future.delayed(Duration(seconds: 1));

    String? token = await SecureStorage.getValue('token');

    // Navigate to login if token is null or empty
    if (token == null || token.isEmpty) {
      emit(SplashScreenRoutingState(toLogin: true));
    } else {
      emit(SplashScreenRoutingState(toLogin: false));
    }
  }
}
