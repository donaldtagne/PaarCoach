import 'package:flutter_bloc/flutter_bloc.dart';

import 'navigation_event.dart';
import 'navigation_state.dart';
import 'navigation_type.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  final List<NavigationState> _history = [HomePageState()];
  NavigationEvent? lastEvent;

  NavigationBloc() : super(HomePageState()) {
    on<NavigateBackEvent>((event, emit) => _handleBackEvent(event, emit));
    on<NavigateToHome>((event, emit) => _handleGeneralEvent(event, emit, HomePageState()));
    on<NavigateSignUpToLogin>((event, emit) => _handleGeneralEvent(event, emit, SignUpToLoginState()));
    on<NavigateLoginToHome>((event, emit) => _handleGeneralEvent(event, emit, LoginToHomeState()));
    on<NavigateLoginToSignup>((event, emit) => _handleGeneralEvent(event, emit, LoginToSignupState()));
    on<NavigateHomeToCommunity>((event, emit) => _handleGeneralEvent(event, emit, HomePageToCommunityState()));
    on<NavigateWelcomeToSignup>((event, emit) => _handleGeneralEvent(event, emit, WelcomeToSignupState()));
    on<NavigateSplashScreenToWelcome>((event,emit)=> _handleGeneralEvent(event, emit, SplashScreenToWelcomeState()));

  }

  void _handleGeneralEvent(NavigationEvent event, Emitter<NavigationState> emit, NavigationState state) {
    lastEvent = event;

    if (event.navigationType == NavigationType.PUSH) {
      _history.add(state);
    } else if (_history.isNotEmpty) {
      _history.removeLast();
    }

    emit(state);
  }

  void _handleBackEvent(NavigateBackEvent event, Emitter<NavigationState> emit) {
    lastEvent = event;
    if (_history.isNotEmpty) {
      _history.removeLast();
      var lastOrNull = _history.lastOrNull;
      if (lastOrNull != null) emit(lastOrNull);
      // emit(_history.last);
      /*
      _history.removeLast();
      emit(_history.isNotEmpty ? _history.last : HomePageState(title: 'Default')); // Gehe zur Startseite, wenn die Historie leer ist
       */
    } else {
      // Standardverhalten oder Schließen der App
    }
    // hier weitere Bedingungen für andere Zustände
  }

// void _handleNavigateFiveFingersFingerToFiveFingers(NavigateFiveFingersFingerToFiveFingers event, Emitter<NavigationState> emit) {
//   // Entfernen Sie die aktuelle Seite, falls es eine FiveFingersFingerPage ist
//   if (_history.isNotEmpty && _history.last is FiveFingersFingerPageState) {
//     _history.removeLast();
//   }
//
//   if (_history.isNotEmpty && _history.last is FiveFingersPageState) {
//     var lastState = _history.last as FiveFingersPageState;
//     var updatedState = FiveFingersPageState(projectName: lastState.projectName, updatedFinger: event.finger);
//     _history.removeLast();
//     emit(updatedState);
//   }
// }
}