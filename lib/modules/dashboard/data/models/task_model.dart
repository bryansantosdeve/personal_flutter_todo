import 'package:personal_flutter_todo/modules/dashboard/core/entities/task_entity.dart';

/// Classe que segue o padrão DTO (Data Trasnfer Object) para converter dados para a entidade utilizada no sistema e dados no formato Json.
class TaskModel extends TaskEntity {
  TaskModel(
      {required super.name,
      required super.difficulty,
      required super.isFinished});

  /// Método para conversão de um objeto para o formato Json.
  static Map<String, dynamic> toJson(TaskEntity domain) {
    return {
      'id': domain.id,
      'name': domain.name,
      'difficulty': domain.difficulty,
      'is_finished': domain.isFinished,
    };
  }

  /// Método para conversão de dados em formato Json para um objeto do tipo "TaskEntity".
  static TaskEntity fromJson(Map<String, dynamic> json) {
    return TaskEntity(
      name: json['name'],
      difficulty: json['difficulty'],
      isFinished: json['is_finished'],
    );
  }
}
