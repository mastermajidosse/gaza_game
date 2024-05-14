import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaza/screens/auth/onboarding_screen.dart';
import 'package:gaza/screens/gameplay/gameplay_screen.dart';
import 'package:gaza/screens/others/about_us.dart';
import 'package:gaza/screens/others/continue.dart';
import 'package:gaza/screens/others/levels.dart';
import 'package:gaza/screens/others/menu.dart';
import 'package:gaza/screens/others/more.dart';
import 'package:gaza/screens/others/splash.dart';

const String initialRoute = Splashs.routeName;

class RoutGenerator {
  static Route<dynamic> generateRout(RouteSettings settings) {
    switch (settings.name) {
      case Splashs.routeName:
        return MaterialPageRoute(builder: (_) => Splashs());
      case More.routeName:
        return MaterialPageRoute(builder: (_) => More());
      case Menu.routeName:
        return MaterialPageRoute(builder: (_) => Menu());
      case ContinueScreen.routeName:
        return MaterialPageRoute(builder: (_) => ContinueScreen());
      case LevelScreen.routeName:
        return MaterialPageRoute(builder: (_) => LevelScreen());
      case GamePlay.routeName:
        return MaterialPageRoute(builder: (_) => GamePlay());
      case OnboardingScreen.routeName:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case AboutUs.routeName:
        return MaterialPageRoute(builder: (_) => AboutUs());
////
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('ErrorRoute'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
