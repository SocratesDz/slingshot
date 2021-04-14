import 'package:slingshot/commands/build_file_structure_command.dart';
import 'package:slingshot/commands/show_help_command.dart';
import 'package:slingshot/usecases/build_architecture/build_architecture_use_case_impl.dart';
import 'package:slingshot/usecases/get_project_info/get_project_info_use_case_impl.dart';

void run(List<String> arguments) async {
  var commands = {
    // 'create': CreateProjectCommand(CreateProjectUseCaseImpl()),
    'create': BuildFileStructureCommand(
        BuildArchitectureUseCaseImpl(), GetProjectInfoUseCaseImpl()),
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
