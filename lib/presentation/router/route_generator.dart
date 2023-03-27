import 'package:aisight_app/presentation/screen/camera_screen.dart';
import 'package:aisight_app/presentation/screen/profile_screen.dart';
import 'package:aisight_app/presentation/screen/signup_screen.dart';
import 'package:aisight_app/presentation/screen/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:aisight_app/presentation/screen/home_screen.dart';

class RouteGenerator extends NavigatorObserver {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case '/signup':
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/camera':
        return MaterialPageRoute(builder: (_) => const CameraScreen());
      case '/profile':
        return MaterialPageRoute(builder: (_) => const ProfileScreen());

      default:
        return _errorRoute();
    }
  }
}

Route<dynamic> _errorRoute() {
  return MaterialPageRoute(builder: (_) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
      body: const Center(
        child: Text('ERROR'),
      ),
    );
  });
}
