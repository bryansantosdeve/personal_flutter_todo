import '../../domain/entities/task_entity.dart';

/// Classe abstrata do datasource que define aqueles existentes na implementação de forma que desacople ao restante da implementação.
/// O datasource é definido pela camada que irá trabalhar com a lógica direta de persistir dados, ou seja, possui classes de DAO, por exemplo.
///
abstract class ITaskDataSource {
  Future<void> insert(TaskEntity domain);
}
