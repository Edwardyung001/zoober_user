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
  final String name;
  final String token;
  final int userId;
  LoginSuccess(this.message,this.name,this.token,this.userId);
}

class LoginFailed extends AuthState {
  final String errorMessage;
  LoginFailed(this.errorMessage);
}


class AuthFailure extends AuthState {
  final String error;
  AuthFailure(this.error);
}
