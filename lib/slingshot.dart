import 'dart:convert';
import 'dart:io';

import 'package:slingshot/commands/create_project_command.dart';
import 'package:slingshot/usecases/create_project/create_project_use_case_impl.dart';

void checkVersion() async {
  var checkVersion = await Process.start('flutter', ['--version']);
  await checkVersion.stdout.transform(utf8.decoder).forEach(print);
  var exitCode = await checkVersion.exitCode;

  print(exitCode == 0
      ? 'Flutter is installed!'
      : 'Error! Flutter is not installed.');
}

void run(List<String> arguments) async {
  var commands = {'create': CreateProjectCommand(CreateProjectUseCaseImpl())};
  var commandCli = arguments.first;
  if (commands.containsKey(commandCli)) {
    var command = commands[commandCli];
    await command!(arguments.skip(1).toList());
  }
}
