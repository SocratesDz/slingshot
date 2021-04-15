import 'dart:io';

import 'package:mustache_template/mustache.dart';
import 'package:slingshot/usecases/build_architecture/build_architecture_use_case.dart';
import 'package:slingshot/templates/templates.dart' as templates;

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
    createDirectories(path);
    createFiles(appName, path);
  }

  void createDirectories(String path) {
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
      print('${Directory(path).path}/$d');
      Directory('${Directory(path).path}/$d').createSync(recursive: true);
    }
  }

  void createFiles(String appName, String path) {
    final filesAndAssets = {
      'app/blocs/simple_bloc_observer.dart': templates.blocObserverFile,
      'app/screens/splash_screen.dart': templates.splashScreenFile,
      'app/app.dart': templates.appFile,
      'app/navigator.dart': templates.navigatorFile,
      'data/constants.dart': templates.constantsFile,
      'di/di.dart': templates.diFile,
      'main.dart': templates.mainFile
    };
    filesAndAssets.forEach((filePath, templateStr) {
      if (templateStr.isNotEmpty) {
        final file = File('${Directory(path).path}/$filePath')
          ..createSync(recursive: true);
        final template =
            Template(templateStr, name: file.uri.pathSegments.last);
        final renderedTemplate = template.renderString({'appName': appName});
        print(file.absolute.path);
        file.writeAsStringSync(renderedTemplate);
      }
    });
  }
}
