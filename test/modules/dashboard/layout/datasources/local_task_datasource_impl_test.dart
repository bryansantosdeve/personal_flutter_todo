import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:json_cache/json_cache.dart';
import 'package:localstorage/localstorage.dart';
import 'package:personal_flutter_todo/modules/dashboard/core/entities/task_entity.dart';
import 'package:personal_flutter_todo/modules/dashboard/data/datasources/i_task_datasource.dart';
import 'package:personal_flutter_todo/modules/dashboard/layout/datasources/local_task_datasource_impl.dart';

/// Objeto fake para simular uma entidade do tipo "TaskEntity".
class FakeTaskEntity extends Fake implements TaskEntity {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late ITaskDatasource datasource;
  late LocalStorage storage;
  late JsonCache localStorage;

  setUpAll(() {
    final tempDir = Directory.systemTemp;
    storage = LocalStorage('test.json', tempDir.path);
    datasource = LocalTaskDatasourceImpl(storage);
    localStorage = JsonCacheMem(JsonCacheLocalStorage(storage));
  });

  final fooEntity = TaskEntity(name: 'foo', difficulty: 5, isFinished: true);

  group('This datasource must', () {
    test('recover all elements from a box', () async {
      fooEntity.setId('1');
      final fooResult = await datasource.create(fooEntity);

      final fooJson = await localStorage.value(fooEntity.id);

      expect(await localStorage.contains(fooEntity.id), true);
      expect(fooJson!.isNotEmpty, true);
      expect(fooJson['name'], isNotNull);
      expect(fooJson['name'], fooEntity.name);
      expect(fooJson['difficulty'], isNotNull);
      expect(fooJson['difficulty'], fooEntity.difficulty);
      expect(fooJson['is_finished'], isNotNull);
      expect(fooJson['is_finished'], fooEntity.isFinished);
      expect(fooResult, const Right(null));
      expect(fooResult.isRight(), true);
    });
  });
}
