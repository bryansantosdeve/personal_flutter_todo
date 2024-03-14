import '../../domain/entities/task_entity.dart';

/// Classe DTO para representação de uma entidade do tipo TaskEntity.
///
/// Um Data Transfer Object (DTO) é um padrão de projeto usado para isolar a manipulação em entidades do sistema a partir de interações cliente-servidor. Dessa forma, um DTO
/// pode representar totalmente uma entidade sem que ela seja manuseada ou até mesmo parte de atributos que existem na aplicação, mas que não necessariamente devem ser exibidos
/// ao usuário.
///
class TaskModel {
  /// Conversão de uma entidade do tipo TaskEntity para um json.
  static Map<String, dynamic> toJson(TaskEntity domain) {
    return {
      'task_name': domain.name,
      'task_difficulty': domain.difficulty,
      'task_isFinished': domain.isFinished,
    };
  }

  /// Conversão de um json para uma entidade do tipo TaskEntity.
  static TaskEntity fromJson(Map<String, dynamic> json) {
    return TaskEntity(
        name: json['task_name'],
        difficulty: json['task_difficulty'],
        isFinished: json['task_isFinished']);
  }
}
