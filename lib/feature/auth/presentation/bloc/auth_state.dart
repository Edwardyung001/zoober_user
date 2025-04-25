part of 'auth_bloc.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class SignupSuccess extends AuthState {
  final String message;
  SignupSuccess(this.message);
}


class LoginSuccess extends AuthState {
  final String message;
  final String token;
  final int userId;
  LoginSuccess(this.message,this.token,this.userId);
}


class AuthFailure extends AuthState {
  final String error;
  AuthFailure(this.error);
}
