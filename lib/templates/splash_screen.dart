final _splashScreenFile = '''
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const PATH = '/splash';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Center(
          child: FlutterLogo(
            size: 120,
          ),
        )));
  }
}
''';

final splashScreenFile = _splashScreenFile;
