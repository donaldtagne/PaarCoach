import 'package:first_project/Home_screen.dart';
import 'package:first_project/SignIn_screen.dart';
import 'package:first_project/SignUp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Splash_screen.dart';
import 'home/navigation/bloc/navigation_bloc.dart';
import 'home/navigation/components/NavigationBackDispatcher.Dart.dart';
import 'home/navigation/components/app_router_delegate.dart';
import 'noo.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NavigationBloc>(
      create: (context) => NavigationBloc(),
      child: const MaterialAppWithRouter(),
    );
  }
}

class MaterialAppWithRouter extends StatelessWidget {
  const MaterialAppWithRouter({super.key});

  @override
  Widget build(BuildContext context) {
    var appRouter = AppRouter(context.read<NavigationBloc>());

    return MaterialApp.router(


      routerDelegate: appRouter,
      backButtonDispatcher: NavigationBackDispatcher(appRouter),
    );
  }
}









