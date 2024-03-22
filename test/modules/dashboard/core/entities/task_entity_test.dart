import 'package:flutter_test/flutter_test.dart';
import 'package:personal_flutter_todo/modules/dashboard/core/entities/task_entity.dart';

/// Classe de teste para a entidade "TaskEntity".
/// TODO: Melhorar descrição dos testes
void main() {
  group('This entity should', () {
    const name = 'Create a Flutter app';
    const difficulty = 5;
    const isFinished = false;

    test(
      'create an object',
      () {
        final task = TaskEntity(
            name: name, difficulty: difficulty, isFinished: isFinished);

        expect(task.name, 'Create a Flutter app');
        expect(task.difficulty, 5);
        expect(isFinished, false);
      },
    );

    test(
      'update an object',
      () {
        final task = TaskEntity(
            name: name, difficulty: difficulty, isFinished: isFinished);

        expect(task.name, 'Create a Flutter app');
        expect(task.difficulty, 5);
        expect(isFinished, false);
      },
    );
  });
}
