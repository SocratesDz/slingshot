final _navigatorFile = '''
import 'package:flutter/material.dart';
import 'package:{{appName}}/app/screens/splash_screen.dart';

class AppNavigator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
      case SplashScreen.PATH:
        return MaterialPageRoute(
            builder: (_) => SplashScreen(), settings: settings);
      default:
        return _errorPage();
    }
  }

  static Route<dynamic> _errorPage() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(),
              body: Center(
                child: Text('This is an error page.'),
              ),
            ));
  }
}
''';

final navigatorFile = _navigatorFile;