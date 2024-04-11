import 'package:equatable/equatable.dart';

// States
abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {      // loginstata

}

class LoginLoading extends LoginState {}    // loading state after cliking on "login" botton

class LoginSuccess extends LoginState {}    // if sucess

class LoginFailure extends LoginState {    // if error
  final String error;

  const LoginFailure({required this.error});

  @override
  List<Object?> get props => [error];
}
class LoginGoToSignupState extends LoginState{ } //state :from login to sign
