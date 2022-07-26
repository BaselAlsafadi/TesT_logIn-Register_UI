import 'package:flutter/material.dart';
import 'package:flutter_app/screens/homepage_screen.dart';
import '../screens/login_screen.dart';
import '../screens/sign_in_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {

      /// LogIn Screen
      case '/':
        return MaterialPageRoute(
          builder: (_) => const LogInScreen(),
        );

      /// SignIn Screen
      case '/signinscreen':
        return MaterialPageRoute(
          builder: (_) => const SignInScreen(),
        );

      /// Home Page Screen
      case '/homepagescreen':
        return MaterialPageRoute(
          builder: (_) => const HomePageScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const LogInScreen(),
        );
    }
  }
}
