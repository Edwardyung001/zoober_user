part of 'splashscreen_bloc.dart';

@immutable
abstract class SplashscreenState {}

abstract class SplashscreenActionState extends SplashscreenState {}

class SplashscreenInitial extends SplashscreenState {}

class SplashScreenRoutingState extends SplashscreenActionState {
  final bool toLogin;

  SplashScreenRoutingState({required this.toLogin});
}
