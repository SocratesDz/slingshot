import 'package:slingshot/commands/command.dart';
import 'package:slingshot/usecases/build_architecture/build_architecture_use_case.dart';
import 'package:slingshot/usecases/get_project_info/get_project_info_use_case.dart';

class BuildFileStructureCommand implements Command {
  final BuildArchitectureUseCase buildArchitectureUseCase;
  final GetProjectInfoUseCase getProjectInfoUseCase;

  BuildFileStructureCommand(
      this.buildArchitectureUseCase, this.getProjectInfoUseCase);

  @override
  Future<void> call(List<String> arguments) async {
    try {
      if (getProjectInfoUseCase.isFlutterProject()!) {
        final appName = getProjectInfoUseCase.getAppName();
        final libPath = getProjectInfoUseCase.getLibDirectoryPath();
        buildArchitectureUseCase(appName: appName!, path: libPath!);
      } else {
        print('Not inside Flutter project.');
      }
    } on Exception catch (e, s) {
      print(e.toString());
      print(s.toString());
    }
  }
}
