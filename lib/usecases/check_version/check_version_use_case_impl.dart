import 'dart:convert';
import 'dart:io';

import 'package:slingshot/usecases/check_version/check_version_use_case.dart';

class CheckVersionUseCaseImpl implements CheckVersionUseCase {
  @override
  Future<bool> call() async {
    var checkVersion = await Process.start('flutter', ['--version']);
    await checkVersion.stdout.transform(utf8.decoder).forEach(print);
    var exitCode = await checkVersion.exitCode;
    var success = exitCode == 0;
    return success;
  }
}
