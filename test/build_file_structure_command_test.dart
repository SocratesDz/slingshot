import 'dart:io';

import 'package:mustache_template/mustache_template.dart';
import 'package:test/test.dart';
import 'package:yaml/yaml.dart';

void main() {
  group('Project structure', () {
    final test_path = 'test/test_bin';
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
        buildFolderStructure(app_name, test_path);
      }
    });

    tearDown(() {
      // Directory(test_path).deleteSync(recursive: true);
    });
  });
}

void buildFolderStructure(app_name, path) {
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
    Directory('${Directory(path).path}/$d').createSync(recursive: true);
  }

  final filesAndAssets = {
    'app/blocs/simple_bloc_observer.dart':
        'assets/templates/simple_bloc_observer.dart.template',
    'app/app.dart': '',
    'app/navigator.dart': '',
    'data/constants.dart': '',
    'di/di.dart': ''
  };
  filesAndAssets.forEach((filePath, templatePath) {
    if (templatePath.isNotEmpty) {
      final file = File('${Directory(path).path}/$filePath')
        ..createSync(recursive: true);
      final templateFileSource = File(templatePath).readAsStringSync();
      final template =
          Template(templateFileSource, name: file.uri.pathSegments.last);
      final renderedTemplate = template.renderString({});
      file.writeAsStringSync(renderedTemplate);
    }
  });
}
