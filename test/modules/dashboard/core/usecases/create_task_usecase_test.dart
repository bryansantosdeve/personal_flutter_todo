import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:personal_flutter_todo/modules/dashboard/core/entities/task_entity.dart';
import 'package:personal_flutter_todo/modules/dashboard/core/repositories/i_task_repository.dart';
import 'package:personal_flutter_todo/modules/dashboard/core/usecases/create_task_usecase.dart';

/// Mock do repositório utilizado para o usecase testado.
///
class MockTaskRepository extends Mock implements ITaskRepository {}

/// Objeto fake para simular uma entidade do tipo "TaskEntity".
class FakeTaskEntity extends Fake implements TaskEntity {}

void main() {
  /// Late variables.
  late ICreateTaskUsecase usecase;
  late MockTaskRepository repository;

  /// Setup to all tests.
  setUpAll(() {
    repository = MockTaskRepository();
    usecase = CreateTaskUsecaseImpl(repository);

    registerFallbackValue(FakeTaskEntity());
  });

  /// Objects used on tests.
  final entity = TaskEntity(name: 'name', difficulty: 5, isFinished: true);
  final exception = Exception();

  group('This usecase must', () {
    test('create successfully a new entity based on an instanciated object',
        () async {
      /// Stub to call method
      when(() => repository.create(entity))
          .thenAnswer((_) async => const Right(null));

      var result = await usecase(entity);

      verify(() => repository.create(any())).called(1);

      expect(result, const Right(null));
      expect(result.isRight(), true);
    });

    test('create successfully a new entity based on a fake object', () async {
      /// Stub to call method
      when(() => repository.create(any()))
          .thenAnswer((_) async => const Right(null));

      var result = await usecase(entity);

      verify(() => repository.create(any())).called(1);

      expect(result, const Right(null));
      expect(result.isRight(), true);
    });

    test(
        'receive an exception from repository as a consequence of a failure during the operation',
        () async {
      /// Stub to call method
      when(() => repository.create(entity)).thenThrow(exception);

      final result = await usecase(entity);

      expect(result, Left(exception));
      expect(result.isLeft(), true);

      verify(() => repository.create(any())).called(1);
    });
  });
}
