import 'package:slingshot/commands/create_project_command.dart';
import 'package:slingshot/commands/show_help_command.dart';
import 'package:slingshot/usecases/create_project/create_project_use_case_impl.dart';

void run(List<String> arguments) async {
  var commands = {
    'create': CreateProjectCommand(CreateProjectUseCaseImpl()),
    'help': ShowHelpCommand()
  };

  String commandCli;
  try {
    commandCli = arguments.first;
  } catch (e) {
    commandCli = 'help';
  }
  if (commands.containsKey(commandCli)) {
    var command = commands[commandCli];
    await command!(arguments.skip(1).toList());
  }
}
