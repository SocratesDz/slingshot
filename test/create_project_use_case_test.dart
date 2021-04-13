import 'package:mockito/mockito.dart';
import 'package:slingshot/usecases/create_project/create_project_use_case.dart';
import 'package:test/test.dart';

class MockCreateProjectUsecase extends Mock implements CreateProjectUseCase {}

void main() {
  test('Create project use case with project name.', () {
    final createProjectUseCase = MockCreateProjectUsecase();
    createProjectUseCase('test');
  }, skip: true);
}
