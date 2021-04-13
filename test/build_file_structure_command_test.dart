import 'dart:io';
import 'package:mockito/mockito.dart';
import 'package:slingshot/usecases/build_architecture/build_architecture_use_case_impl.dart';
import 'package:slingshot/usecases/get_project_info/get_project_info_use_case.dart';
import 'package:test/test.dart';

class MockGetProjectInfoUseCase extends Mock implements GetProjectInfoUseCase {}

void main() {
  group('Project structure', () {
    final test_path = 'test/test_bin';
    test('Create basic structure', () {
      // Check if pubspec.yaml is available
      final getProjectInfoUseCase = MockGetProjectInfoUseCase();
      when(getProjectInfoUseCase.getAppName()).thenReturn('test_app');
      when(getProjectInfoUseCase.getVersionName()).thenReturn('1.0.0');
      when(getProjectInfoUseCase.isFlutterProject()).thenReturn(true);

      final insideProjectDir = getProjectInfoUseCase.isFlutterProject();
      if (insideProjectDir == true) {
        // Get project name from pubspect.yaml
        final app_name = getProjectInfoUseCase.getAppName()!;
        // Use project name for package imports

        // Build folder structure
        final buildArchitectureUseCase = BuildArchitectureUseCaseImpl();
        buildArchitectureUseCase(appName: app_name, path: test_path);
      }
    });

    tearDown(() {
      Directory(test_path).deleteSync(recursive: true);
    });
  });
}
