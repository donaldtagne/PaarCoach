import 'package:flutter/material.dart';

import 'app_router_delegate.dart';

class NavigationBackDispatcher extends RootBackButtonDispatcher {
  final AppRouter appRouter;

  NavigationBackDispatcher(this.appRouter);

  @override
  Future<bool> didPopRoute() {
    return Future.value(appRouter.onBackButtonPressed());
  }
}
