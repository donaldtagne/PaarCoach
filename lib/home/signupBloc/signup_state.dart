import 'package:equatable/equatable.dart';

// States
abstract class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object?> get props => [];
}

class SignupInitial extends SignupState {}

// Loading state after clicking on "Sign up" button
class SignupLoadingState extends SignupState {}

class SignupSuccessState extends SignupState {}

class SignupErrorState extends SignupState {
  final String error;

  const SignupErrorState({required this.error});

  @override
  List<Object?> get props => [error];
}

class SignupGoToLoginState extends SignupState {}