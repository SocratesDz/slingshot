import 'dart:io';

import 'package:slingshot/usecases/get_project_info/get_project_info_use_case.dart';
import 'package:yaml/yaml.dart';

class GetProjectInfoUseCaseImpl implements GetProjectInfoUseCase {
  @override
  String? getAppName() {
    if (isFlutterProject() == true) {
      try {
        return _pubspecYaml['name'];
      } catch (ex) {
        rethrow;
      }
    } else {
      throw Exception('Not inside Flutter project.');
    }
  }

  @override
  String? getVersionName() {
    if (isFlutterProject() == true) {
      try {
        return _pubspecYaml['version'];
      } catch (ex) {
        rethrow;
      }
    } else {
      throw Exception('Not inside Flutter project.');
    }
  }

  @override
  bool? isFlutterProject() {
    try {
      final insideProjectDir = _pubspecFile.existsSync();
      return insideProjectDir;
    } catch (ex) {
      rethrow;
    }
  }

  @override
  String? getCurrentPath() {
    return _pubspecFile.parent.path;
  }

  @override
  String? getLibDirectoryPath() {
    return '${getCurrentPath()}/lib';
  }

  File get _pubspecFile => File('pubspec.yaml');
  dynamic get _pubspecYaml => loadYaml(_pubspecFile.readAsStringSync());
}
