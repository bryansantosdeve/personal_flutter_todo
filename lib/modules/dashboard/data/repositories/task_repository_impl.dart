import 'package:dartz/dartz.dart';
import 'package:personal_flutter_todo/modules/dashboard/core/entities/task_entity.dart';
import 'package:personal_flutter_todo/modules/dashboard/core/repositories/i_task_repository.dart';
import 'package:personal_flutter_todo/modules/dashboard/data/datasources/i_task_datasource.dart';

/// Implementação do Repository para conter toda a lógica e possíveis regras para a pré-persistência de dados. Essa definição considera a conversão de dados externos para
/// entidades e outros tipos de objetos usados na aplicação.
///
/// Injetamos o datasource no construtor para seguir os princípios de arquitetura limpa e invertemos a dependência (Princípios SOLID).
///
class TaskRepositoryImpl implements ITaskRepository {
  TaskRepositoryImpl(this._taskDatasource);

  final ITaskDatasource _taskDatasource;

  @override
  Future<Either<Exception, void>> create(TaskEntity domain) async {
    try {
      return await _taskDatasource.create(domain);
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<Either<Exception, List<TaskEntity>>> getAll() async {
    try {
      return await _taskDatasource.getAll();
    } on Exception {
      rethrow;
    }
  }
}
