final _appFile = '''
import 'package:flutter/material.dart';
import 'package:{{appName}}/app/navigator.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: AppNavigator.generateRoute,
    );
  }
}
''';

final appFile = _appFile;
