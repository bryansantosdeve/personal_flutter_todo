import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:personal_flutter_todo/modules/dashboard/core/entities/task_entity.dart';
import 'package:personal_flutter_todo/modules/dashboard/core/repositories/i_task_repository.dart';
import 'package:personal_flutter_todo/modules/dashboard/data/datasources/i_task_datasource.dart';
import 'package:personal_flutter_todo/modules/dashboard/data/repositories/task_repository_impl.dart';

/// Mock do datasource utilizado para o repositório testado.
class MockTaskDatasource extends Mock implements ITaskDatasource {}

/// Objeto fake para simular uma entidade do tipo "TaskEntity".
class FakeTaskEntity extends Fake implements TaskEntity {}

void main() {
  /// Late variables.
  late ITaskRepository repository;
  late ITaskDatasource datasource;

  /// Setup to all tests.
  setUpAll(() {
    datasource = MockTaskDatasource();
    repository = TaskRepositoryImpl(datasource);

    registerFallbackValue(FakeTaskEntity());
  });

  /// Objects used on tests.
  final fooEntity = TaskEntity(name: 'foo', difficulty: 5, isFinished: false);
  final barEntity = TaskEntity(name: 'bar', difficulty: 1, isFinished: true);
  final tasks = [fooEntity, barEntity];

  final exception = Exception();

  group('This repository must', () {
    test('convert items and persist to datasource as an entity', () async {
      /// Stub to call method
      when(() => datasource.create(any()))
          .thenAnswer((_) async => const Right(null));

      final result = await repository.create(fooEntity);

      expect(result.isRight(), true);
      expect(result, const Right(null));
    });

    test(
        'get a list of items from datasource and then convert them from entity to a model',
        () async {
      /// Stub to call method
      when(() => datasource.getAll()).thenAnswer((_) async => Right(tasks));

      final result = await repository.getAll();

      expect(result, isNotNull);
      expect(result.isRight(), true);
    });

    test(
        'handle with an error or bad call generated on datasource while trying to get all data',
        () async {
      /// Stub to call method
      when(() => datasource.getAll()).thenAnswer((_) async => Left(exception));

      final result = await repository.getAll();

      expect(result, isNotNull);
      expect(result.isLeft(), true);
    });

    // test('generate an exception while trying to get all data from datasource',
    //     () async {
    //   /// Stub to call method
    //   when(() => datasource.getAll()).thenThrow(exception);

    //   final result = await repository.getAll();

    //   expect(result, Exception());
    // });
  });
}
