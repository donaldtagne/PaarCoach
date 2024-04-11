import 'package:bloc/bloc.dart';

import  'login_event.dart';
import 'login_state.dart';

// Bloc
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginButtonPressedEvent>(_login);
    on<LoginGoToSignupEvent>(_signup);
  }

  Future<void> _login(LoginButtonPressedEvent event,   // associate Event to State
      Emitter<LoginState> emit,) async {
    if (event.email.isEmpty) {
      emit(const LoginFailure(error: "Please enter email"));
    } else if (event.password.isEmpty) {
      emit(const LoginFailure(error: "Please enter password"));
    } else {
      emit(LoginLoading());
      /*
        // ToDo: check the auth
        */
      emit(LoginSuccess());
    }
  }

  Future<void> _signup(LoginGoToSignupEvent event,   // associate Event to State
      Emitter<LoginState> emit,) async {
    /*
        // TODO
        */
    emit(LoginGoToSignupState());
  }
}










