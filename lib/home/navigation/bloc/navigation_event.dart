import 'navigation_type.dart';

abstract class NavigationEvent {
  final NavigationType navigationType;

  NavigationEvent({required this.navigationType});
}
class NavigateBackEvent extends NavigationEvent {
  NavigateBackEvent() : super(navigationType: NavigationType.POP);
}
class NavigateToHome extends NavigationEvent {

  NavigateToHome()
      : super(navigationType: NavigationType.PUSH);
}

class NavigateSignUpToLogin extends NavigationEvent {

  NavigateSignUpToLogin()
      : super(navigationType: NavigationType.PUSH);
}
class NavigateLoginToHome extends NavigationEvent {

  NavigateLoginToHome():
        super(navigationType: NavigationType.PUSH);
}
class NavigateLoginToSignup extends NavigationEvent {

  NavigateLoginToSignup():
        super(navigationType: NavigationType.PUSH);

}

class NavigateHomeToCommunity extends NavigationEvent{


  NavigateHomeToCommunity(): super(navigationType: NavigationType.PUSH);

}

class NavigateSplashScreenToWelcome extends NavigationEvent{


  NavigateSplashScreenToWelcome(): super(navigationType: NavigationType.PUSH);

}

class NavigateWelcomeToSignup extends NavigationEvent{


  NavigateWelcomeToSignup(): super(navigationType: NavigationType.PUSH);

}

