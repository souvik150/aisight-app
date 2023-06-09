import 'package:aisight_app/presentation/screen/analysis_result.dart';
import 'package:aisight_app/presentation/screen/camera_screen.dart';
import 'package:aisight_app/presentation/screen/gallery_screen.dart';
import 'package:aisight_app/presentation/screen/image_screen.dart';
import 'package:aisight_app/presentation/screen/login_screen.dart';
import 'package:aisight_app/presentation/screen/profile_screen.dart';
import 'package:aisight_app/presentation/screen/signup_screen.dart';
import 'package:aisight_app/presentation/screen/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:aisight_app/presentation/screen/home_screen.dart';

class RouteGenerator extends NavigatorObserver {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case '/signup':
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/image':
        return MaterialPageRoute(builder: (_) => const ImageScreen());
      case '/camera':
        return MaterialPageRoute(builder: (_) => const CameraScreen());
      case '/gallery':
        return MaterialPageRoute(builder: (_) => const GalleryScreen());
      case '/profile':
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case '/analysis':
        return MaterialPageRoute(builder: (_) => AnalysisResult());

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
