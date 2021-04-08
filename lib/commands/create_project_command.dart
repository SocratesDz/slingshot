import 'package:slingshot/commands/command.dart';
import 'package:slingshot/usecases/create_project/create_project_use_case.dart';

class CreateProjectCommand implements Command {
  CreateProjectUseCase useCase;

  CreateProjectCommand(this.useCase);

  @override
  Future<void> call(List<String> arguments) async {
    var projectName = '';
    if (arguments.contains('--org') || arguments.contains('--description')) {}
    projectName = arguments.first;
    useCase(projectName);
  }
}
