import 'package:slingshot/commands/command.dart';

class ShowHelpCommand implements Command {
  @override
  Future<void> call(List<String> arguments) async {
    print('usage: slingshot create <project_name>');
  }
}
