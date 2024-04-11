import 'dart:io';

import 'package:equatable/equatable.dart';

// Events
abstract class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object?> get props => [];
}

class SignupButtonPressedEvent extends SignupEvent {
  final String username;
  final String email;
  final String password;

  const SignupButtonPressedEvent({required this.username, required this.password, required this.email});

  @override
  List<Object?> get props => [username, email, password];
}

class SignupGoToLoginEvent extends SignupEvent {}
