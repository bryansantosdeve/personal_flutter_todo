import '../../data/datasources/i_task_datasource.dart';
import '../../domain/entities/task_entity.dart';

/// Implementação do repositório. Essa classe da liberdade para fazer a tratativa de possíveis erros retornados do datasource, efetuar conversões de domínios para DTOs e
/// vice-versa.
///
///Injetamos o datasource no construtor para seguir os princípios de arquitetura limpa e invertemos a dependência (Princípios SOLID).
///
class TaskDataSourceImpl implements ITaskDataSource {
  @override
  Future<void> insert(TaskEntity domain) async {}
}
