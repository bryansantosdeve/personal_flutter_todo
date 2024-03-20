import 'package:dartz/dartz.dart';

import '../entities/task_entity.dart';
import '../repositories/i_task_repository.dart';

/// Interface do Usecase para criar uma tarefa
///
abstract class ICreateTaskUsecase {
  Future<Either<Exception, void>> call(TaskEntity taskEntity);
}

/// Implementação do Usecase para criar uma tarefa. Executa a inserção do item em um armazenamento.
///
/// Injetamos o repositório no construtor para seguir os princípios de arquitetura limpa e invertemos a dependência (Princípios SOLID).
///
class CreateTaskUsecaseImpl implements ICreateTaskUsecase {
  CreateTaskUsecaseImpl(this._taskRepository);

  final ITaskRepository _taskRepository;

  @override
  Future<Either<Exception, void>> call(TaskEntity taskEntity) async {
    try {
      await _taskRepository.create(taskEntity);
      return const Right(null);
    } on Exception catch (exception) {
      return Left(exception);
    }
  }
}
