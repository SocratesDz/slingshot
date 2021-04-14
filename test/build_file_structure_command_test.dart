import 'dart:io';
import 'package:mockito/mockito.dart';
import 'package:slingshot/commands/build_file_structure_command.dart';
import 'package:slingshot/usecases/build_architecture/build_architecture_use_case_impl.dart';
import 'package:slingshot/usecases/get_project_info/get_project_info_use_case.dart';
import 'package:test/test.dart';

class MockGetProjectInfoUseCase extends Mock implements GetProjectInfoUseCase {}

void main() {
  group('Project structure', () {
    final test_path = 'test/test_bin';
    test('Create basic structure', () {
      final getProjectInfoUseCase = MockGetProjectInfoUseCase();
      when(getProjectInfoUseCase.getAppName()).thenReturn('test_app');
      when(getProjectInfoUseCase.getVersionName()).thenReturn('1.0.0');
      when(getProjectInfoUseCase.isFlutterProject()).thenReturn(true);
      when(getProjectInfoUseCase.getCurrentPath())
          .thenReturn('${Directory.current.path}/$test_path');

      final insideProjectDir = getProjectInfoUseCase.isFlutterProject();
      if (insideProjectDir == true) {
        final buildArchitectureUseCase = BuildArchitectureUseCaseImpl();
        final command = BuildFileStructureCommand(
            buildArchitectureUseCase, getProjectInfoUseCase);
        command([]);
      }
    });

    tearDown(() {
      Directory(test_path).deleteSync(recursive: true);
    });
  });
}
