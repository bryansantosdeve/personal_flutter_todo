import '../entities/task_entity.dart';

/// Classe abstrata do repositório que define aqueles existentes na implementação de forma que desacople ao restante da implementação.
///
abstract class ITaskRepository {
  Future<void> create(TaskEntity domain);
}
