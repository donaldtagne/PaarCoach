import 'package:equatable/equatable.dart';

// Events
abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

class LoginButtonPressedEvent extends LoginEvent {    // creat event after pressing on login button
  final String email;     // the event take 2 variable
  final String password;

  const LoginButtonPressedEvent({required this.email, required this.password});  // we habe anly one event, this is when the user click on the login

  @override
  List<Object?> get props => [email, password];
}

class LoginGoToSignupEvent extends LoginEvent {} // creat event after pressing on Textbutton




