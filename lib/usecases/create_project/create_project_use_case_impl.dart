import 'dart:io';

import 'package:slingshot/usecases/create_project/create_project_use_case.dart';

class CreateProjectUseCaseImpl implements CreateProjectUseCase {
  @override
  void call(String projectName, {String? orgName, String? description}) async {
    var arguments = ['create'];
    if (orgName != null) {
      arguments.addAll(['--org', orgName]);
    }
    if (description != null) {
      arguments.addAll(['--description', description]);
    }
    arguments.add(projectName);
    Process.runSync('flutter', arguments);
  }
}
