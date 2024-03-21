import 'package:flutter_test/flutter_test.dart';
import 'package:personal_flutter_todo/modules/dashboard/core/entities/task_entity.dart';
import 'package:personal_flutter_todo/modules/dashboard/data/models/task_model.dart';

void main() {
  late TaskEntity entity;
  late Map<String, dynamic> json;

  const name = 'foo';
  const difficulty = 5;
  const isFinished = false;

  setUpAll(() {
    entity =
        TaskEntity(name: name, difficulty: difficulty, isFinished: isFinished);

    json = {'name': name, 'difficulty': difficulty, 'is_finished': isFinished};
  });

  group('This model should', () {
    test('convert an object to Json', () {
      final result = TaskModel.toJson(entity);

      expect(result, isNotNull);
      expect(result, isNotEmpty);
      expect(result.length, 3);

      expect(result.containsKey('name'), true);
      expect(result.containsValue(name), true);
      expect(result['name'], isNotNull);
      expect(result['name'], name);

      expect(result.containsKey('difficulty'), true);
      expect(result.containsValue(difficulty), true);
      expect(result['difficulty'], isNotNull);
      expect(result['difficulty'], difficulty);

      expect(result.containsKey('is_finished'), true);
      expect(result.containsValue(isFinished), true);
      expect(result['is_finished'], isNotNull);
      expect(result['is_finished'], isFinished);
    });

    test('convert a json to an Object from class "TaskEntity" ', () {
      final result = TaskModel.fromJson(json);

      expect(result.runtimeType, TaskEntity);
      expect(result.name, name);
      expect(result.difficulty, difficulty);
      expect(result.isFinished, isFinished);
    });
  });
}
