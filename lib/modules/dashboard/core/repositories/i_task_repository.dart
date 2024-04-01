import 'package:dartz/dartz.dart';

import '../entities/task_entity.dart';

/// Classe abstrata do repositório que define aqueles existentes na implementação de forma que desacople ao restante da implementação.
///
abstract class ITaskRepository {
  Future<Either<Exception, void>> create(TaskEntity domain);

  Future<Either<Exception, TaskEntity>> get(String key);
}
