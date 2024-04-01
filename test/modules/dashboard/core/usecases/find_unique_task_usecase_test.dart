import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:personal_flutter_todo/modules/dashboard/core/entities/task_entity.dart';
import 'package:personal_flutter_todo/modules/dashboard/core/repositories/i_task_repository.dart';
import 'package:personal_flutter_todo/modules/dashboard/core/usecases/find_unique_task_usecase.dart';

/// Mock do repositório utilizado para o usecase testado.
///
class MockTaskRepository extends Mock implements ITaskRepository {}

/// Objeto fake para simular uma entidade do tipo "TaskEntity".
class FakeTaskEntity extends Fake implements TaskEntity {}

void main() {
  late IFindUniqueTaskUsecase usecase;
  late ITaskRepository repository;

  const key = 'key';

  setUpAll(() {
    repository = MockTaskRepository();
    usecase = FindUniqueTaskUsecaseImpl(repository);
    registerFallbackValue(FakeTaskEntity());
  });

  final domain =
      TaskEntity(name: 'foo', difficulty: 5, isFinished: true, id: key);
  final exception = Exception();

  group('This usecase must', () {
    test('find a task by id recovered from repository successfully', () async {
      /// Stub to call method
      when(() => repository.get(any())).thenAnswer((_) async => Right(domain));

      final result = await usecase(key);

      expect(result, isNotNull);
      expect(result.isRight(), true);
      expect(result, Right(domain));
    });

    test('try to find an task and handle with exception nested on Left return',
        () async {
      /// Stub to call method
      when(() => repository.get(any()))
          .thenAnswer((_) async => Left(exception));

      final result = await usecase(key);

      expect(result.isLeft(), true);
      expect(result, isNotNull);
      expect(result, Left(exception));
    });

    test('handle with exception generated during repository call', () async {
      /// Stub to call method
      when(() => repository.get(any())).thenThrow(Exception());

      final result = await usecase(key);

      expect(result.isLeft(), true);
      expect(result, isNotNull);
    });
  });
}
