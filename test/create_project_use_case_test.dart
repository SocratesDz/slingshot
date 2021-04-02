import 'package:slingshot/usecases/create_project/create_project_use_case_impl.dart';
import 'package:test/test.dart';

void main() {
  test('Create project use case with project name.', () {
    final createProjectUseCase = CreateProjectUseCaseImpl();
    createProjectUseCase('test');
  });
}
