import 'dart:io';

import 'package:test/test.dart';
import 'package:yaml/yaml.dart';

void main() {
  test('Create basic structure', () {
    // Check if pubspec.yaml is available
    final insideProjectDir = File('pubspec.yaml').existsSync();
    if (insideProjectDir) {
      final pubspec =
          loadYaml('name: test_app\ndescription: test app for test suite');
      // Get project name from pubspect.yaml
      final app_name = pubspec['name'];
      // Use project name for package imports
      // Build folder structure
      buildFolderStructure(app_name);
    }
  });
}

void buildFolderStructure(app_name) {
  // File structure:
  // - app/
  //  - blocs/
  //    - simple_bloc_delegate.dart
  //  - screens/
  //  - themes/
  //  - utils/
  //  - widgets/
  //  - app.dart
  //  - navigator.dart
  // - data/
  //  - source/
  //    - local/
  //    - remote/
  //    - mappers/
  //  - constants.dart
  // - di/
  //  - di.dart
  // - domain/
  //  - entities/
  //  - repositories/
  //  - usecases/
  // - l10n/

  // Create 'app' directory
  final directories = [
    'app/blocs',
    'app/screens',
    'app/themes',
    'app/utils',
    'app/widgets',
    'data/source/local',
    'data/source/remote',
    'data/source/mappers',
    'di',
    'domain/entities',
    'domain/repositories',
    'domain/usecases',
    'l10n'
  ];
  for (var d in directories) {
    Directory('test/bin/$d').createSync(recursive: true);
  }
}
