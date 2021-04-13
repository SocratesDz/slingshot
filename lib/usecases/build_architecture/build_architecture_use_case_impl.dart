import 'dart:io';

import 'package:mustache_template/mustache.dart';
import 'package:slingshot/usecases/build_architecture/build_architecture_use_case.dart';

class BuildArchitectureUseCaseImpl implements BuildArchitectureUseCase {
  @override
  void call({required String appName, required String path}) {
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
}
