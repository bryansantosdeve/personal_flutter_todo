import 'package:dartz/dartz.dart';
import 'package:personal_flutter_todo/modules/dashboard/core/entities/task_entity.dart';
import 'package:personal_flutter_todo/modules/dashboard/core/repositories/i_task_repository.dart';

/// Interface do Usecase para recuperar uma tarefa existente no sistema.
///
abstract class IFindUniqueTaskUsecase {
  Future<Either<Exception, TaskEntity>> call(String key);
}

/// Implementação do Usecase para recuperar uma tarefa baseado na chave correspondente ao registrado no sistema.
///
/// Injetamos o repositório no construtor para seguir os princípios de arquitetura limpa e invertemos a dependência (Princípios SOLID).
///
class FindUniqueTaskUsecaseImpl implements IFindUniqueTaskUsecase {
  FindUniqueTaskUsecaseImpl(this._taskRepository);

  final ITaskRepository _taskRepository;

  @override
  Future<Either<Exception, TaskEntity>> call(String key) async {
    try {
      return await _taskRepository.get(key);
    } on Exception catch (exception) {
      return Left(exception);
    }
  }
}
