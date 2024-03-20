import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:personal_flutter_todo/modules/dashboard/core/entities/task_entity.dart';
import 'package:personal_flutter_todo/modules/dashboard/core/repositories/i_task_repository.dart';
import 'package:personal_flutter_todo/modules/dashboard/core/usecases/get_all_tasks_usecase.dart';

/// Mock do repositório utilizado para o usecase testado.
///
class MockTaskRepository extends Mock implements ITaskRepository {}

void main() {
  /// Late variables.
  late IGetAllTasksUsecase usecase;
  late MockTaskRepository repository;

  /// Setup to all tests.
  setUpAll(() {
    repository = MockTaskRepository();
    usecase = GetAllTasksUsecaseImpl(repository);
  });

  /// Objects used on tests.
  final tasks = [
    TaskEntity(name: 'Drink water', difficulty: 3, isFinished: false),
    TaskEntity(name: 'Drawing', difficulty: 2, isFinished: false),
    TaskEntity(name: 'Play guitar', difficulty: 5, isFinished: false)
  ];

  final exception = Exception();

  group('This usecase must', () {
    test('get all tasks available on repository successfully', () async {
      /// Stub to call method
      when(() => repository.getAll()).thenAnswer((_) async => Right(tasks));

      final result = await usecase();

      final list = [];
      result.fold((l) => l, (usecaseList) {
        for (var element in usecaseList) {
          list.add(element);
        }
      });

      expect(result.isRight(), true);
      expect(list, tasks);
      expect(list[0], tasks[0]);
      expect(list[1], tasks[1]);
      expect(list[2], list[2]);
      expect(list.length, tasks.length);
      expect(list.isNotEmpty, true);

      verify(() => repository.getAll()).called(1);
    });

    test('return an exception, implying on an error during the operation',
        () async {
      /// Stub to call method
      when(() => repository.getAll()).thenThrow(exception);

      final result = await usecase();

      expect(result.isLeft(), true);
      expect(result, Left(exception));

      verify(() => repository.getAll()).called(1);
    });
  });
}
