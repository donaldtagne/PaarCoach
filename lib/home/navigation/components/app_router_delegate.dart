import 'dart:async';

import 'package:first_project/SignIn_screen.dart';
import 'package:first_project/Splash_screen.dart';
import 'package:first_project/Welcome_screen.dart';
import 'package:first_project/home/navigation/components/width_wrapper.dart';
import 'package:flutter/material.dart';

import '../../../Home.dart';
import '../../../SignUp_screen.dart';
import '../bloc/navigation_bloc.dart';
import '../bloc/navigation_event.dart';
import '../bloc/navigation_state.dart';
import '../bloc/navigation_type.dart';

class AppRouter extends RouterDelegate<NavigationState>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<NavigationState> {
  final NavigationBloc navigationBloc;
  final GlobalKey<NavigatorState> navKey;
  final List<Page> pageStack = [
    MaterialPage(
        child: WidthWrapper.wrapWithMaxWidth(
            SplashPage()))
// MaterialPage(child: WidthWrapper.wrapWithMaxWidth(const FiveFingersPage(projectName: 'Home')))
  ]; // Initialer Page-Stack

  AppRouter(this.navigationBloc) : navKey = GlobalKey<NavigatorState>() {
    navigationBloc.stream.listen((state) {
      _updatePageStack(state);
      notifyListeners();
    });
  }

  void _updatePageStack(NavigationState state) {
    final page = _getPageForState(state);

    if (page != null) {
// Bestimmen, ob es sich um eine Push- oder Pop-Navigation handelt
      NavigationType? navigationType = navigationBloc.lastEvent?.navigationType;

      if (navigationType == NavigationType.PUSH) {
// Logik zum Hinzufügen einer neuen Seite zum Stack
        pageStack.add(MaterialPage(child: page));
      } else if (navigationType == NavigationType.POP) {
// Logik zum Entfernen der aktuellen Seite vom Stack
        if (pageStack.isNotEmpty) {
          pageStack.removeLast();
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navKey,
      onPopPage: _onPopPage,
      pages: List.of(pageStack), // Erzeugt die Seiten aus dem Stack
    );
  }

  Widget? _getPageForState(NavigationState state) {
    Widget? page;

    if (state is HomePageState) {
      page = HomePage();
    } else if (state is SignUpToLoginState) {
      page=SignInPage();
    }else if (state is SplashScreenToWelcomeState) {
      page=Welcome();
    }else if (state is WelcomeToSignupState){
      page= SignUpPage();
    }
    else if (state is LoginToHomeState) {
      page = HomePage();
    } else if (state is LoginToSignupState) {
    }
    else if (state is HomePageToCommunityState) {
      page = HomePage();
    }

    return page != null ? WidthWrapper.wrapWithMaxWidth(page) : null;
  }

  bool _onPopPage(Route<dynamic> route, result) {
    if (!route.didPop(result)) return false;

    if (pageStack.isNotEmpty)
      pageStack.removeLast(); // Entfernt die oberste Seite vom Stack
    navigationBloc.add(NavigateBackEvent());

    return true;
  }

  @override
  Future<void> setNewRoutePath(NavigationState configuration) async {
// Ihre Logik zur Aktualisierung des Routenpfads
  }

  Future<bool> onBackButtonPressed() async {
    if (navKey.currentState?.canPop() ?? false) {
      navKey.currentState?.pop();
      return true;
    } else {
//Aktion, wenn keine Seite mehr zu poppen ist
      return true; // Verhindert das Schließen der App
    }
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => navKey;

  @override
  NavigationState get currentConfiguration => navigationBloc.state;
}

