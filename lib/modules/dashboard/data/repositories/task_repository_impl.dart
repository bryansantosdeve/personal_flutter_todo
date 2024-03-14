import 'package:personal_flutter_todo/modules/dashboard/domain/entities/task_entity.dart';
import 'package:personal_flutter_todo/modules/dashboard/domain/repositories/i_task_repository.dart';

import '../datasources/i_task_datasource.dart';

/// Implementação do repositório. Essa classe da liberdade para fazer a tratativa de possíveis erros retornados do datasource, efetuar conversões de domínios para DTOs e
/// vice-versa.
///
///Injetamos o datasource no construtor para seguir os princípios de arquitetura limpa e invertemos a dependência (Princípios SOLID).
///
class TaskRepositoryImpl implements ITaskRepository {
  TaskRepositoryImpl(this._taskDataSource);

  final ITaskDataSource _taskDataSource;

  @override
  Future<void> create(TaskEntity domain) async {
    try {
      return await _taskDataSource.insert(domain);
    } catch (exception) {
      rethrow;
    }
  }
}
