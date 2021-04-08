import 'package:slingshot/commands/command.dart';
import 'package:slingshot/usecases/check_version/check_version_use_case.dart';

class CheckVersionCommand implements Command {
  CheckVersionUseCase useCase;

  CheckVersionCommand(this.useCase);

  @override
  Future<void> call(List<String> arguments) async {
    await useCase();
  }
}
