
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoober_user_ride/feature/auth/domain/usecase/login_usecase.dart';
import 'package:zoober_user_ride/feature/auth/domain/usecase/signup_usecase.dart';

part 'auth_state.dart';
part 'auth_event.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignupUseCase signupUseCase;
  final LoginUseCase loginUseCase;

  AuthBloc(this.signupUseCase, this.loginUseCase) : super(AuthInitial()) {
    on<SignupRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        final response = await signupUseCase(event.email,event.mobileNumber, event.firstName,event.lastName,event.gender,event.dob,event.password);
        if(response.success) {
          emit(SignupSuccess(response.message));
        }
      else{
      emit(LoginFailed(response.message));
      }
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });


    on<LoginRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        final response = await loginUseCase(event.phoneNumber,event.password);
        if(response.success){
          emit(LoginSuccess(response.message,response.name,response.token,response.userId));
        }
        else{
          emit(LoginFailed(response.message));
        }
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });

  }
}
