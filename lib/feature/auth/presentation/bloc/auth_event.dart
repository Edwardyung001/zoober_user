part of 'auth_bloc.dart';

abstract class AuthEvent {}

class SignupRequested extends AuthEvent {
  final String email;
  final String mobileNumber;
  final String firstName;
  final String lastName;
  final String gender;
  final String dob;
  final String password;

  SignupRequested({required this.email,required this.mobileNumber,required this.firstName,required this.lastName,required this.gender,required this.dob,required this.password});
}

class LoginRequested extends AuthEvent {
  final String phoneNumber;
  final String password;

  LoginRequested({required this.phoneNumber,required this.password});
}
