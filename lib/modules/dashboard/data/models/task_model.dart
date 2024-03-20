import 'package:personal_flutter_todo/modules/dashboard/core/entities/task_entity.dart';

class TaskModel extends TaskEntity {
  TaskModel(
      {required super.name,
      required super.difficulty,
      required super.isFinished});

  Map<String, dynamic> toJson(TaskEntity domain) {
    return {
      'name': domain.name,
      'difficulty': domain.difficulty,
      'is_finished': domain.isFinished,
    };
  }

  TaskEntity fromJson(Map<String, dynamic> json) {
    return TaskEntity(
        name: json['name'],
        difficulty: json['difficulty'],
        isFinished: json['is_finished']);
  }
}
