import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'signup_event.dart';
import 'signup_state.dart';
import 'package:http/http.dart' as http;


class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    on<SignupButtonPressedEvent>(_signup);
    on<SignupGoToLoginEvent>(_login);
  }

  // SignUp button is pressed
  Future<void> _signup(
      SignupButtonPressedEvent event,
      Emitter<SignupState> emit,
      ) async {
    emit(SignupSuccessState());

    /*final email = event.email;
    final password = event.password;
    final username= event.username;

    final response = await http.post(
      Uri.parse('http://10.0.2.2:8080/signup'),

      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'email': email,
        'password': password,

      }),
    );

    if (response.statusCode == 200) {

      print('success inscription for new  user into database');
    } else {

      print('error inscription: ${response.body}');
    }

    if (event.username.isEmpty) {
      emit(const SignupErrorState(error: "Please enter username"));
    } else if (event.email.isEmpty) {
      emit(const SignupErrorState(error: "Please enter email"));
    } else if (event.password.isEmpty) {
      emit(const SignupErrorState(error: "Please enter password"));
    }*/

      


  }

  // Login link is pressed
  Future<void> _login(
      SignupGoToLoginEvent event,
      Emitter<SignupState> emit,
      ) async {
    emit(SignupGoToLoginState());
  }
}
