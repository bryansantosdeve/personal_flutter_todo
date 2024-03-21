import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:personal_flutter_todo/modules/dashboard/core/entities/task_entity.dart';
import 'package:personal_flutter_todo/modules/dashboard/core/repositories/i_task_repository.dart';
import 'package:personal_flutter_todo/modules/dashboard/data/datasources/i_task_datasource.dart';
import 'package:personal_flutter_todo/modules/dashboard/data/repositories/task_repository_impl.dart';

class MockTaskDatasource extends Mock implements ITaskDatasource {}

class FakeTaskEntity extends Fake implements TaskEntity {}

void main() {
  late ITaskRepository repository;
  late ITaskDatasource datasource;

  final fooEntity = TaskEntity(name: 'foo', difficulty: 5, isFinished: false);
  final barEntity = TaskEntity(name: 'bar', difficulty: 1, isFinished: true);

  final tasks = [fooEntity, barEntity];

  setUpAll(() {
    datasource = MockTaskDatasource();
    repository = TaskRepositoryImpl(datasource);

    registerFallbackValue(FakeTaskEntity());
  });

  group('This repository must', () {
    test('convert items and persist to datasource as an entity', () async {
      when(() => datasource.create(any()))
          .thenAnswer((_) async => const Right(null));

      final result = await repository.create(fooEntity);

      expect(result.isRight(), true);
      expect(result, const Right(null));
    });

    test(
        'get a list of items from datasource and then convert them from entity to a model',
        () async {
      when(() => datasource.getAll()).thenAnswer((_) async => Right(tasks));

      final result = await repository.getAll();

      expect(result, isNotNull);
      expect(result.isRight(), true);
    });
  });
}
