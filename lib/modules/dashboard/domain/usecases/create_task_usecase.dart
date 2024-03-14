import 'package:personal_flutter_todo/modules/dashboard/domain/entities/task_entity.dart';
import 'package:personal_flutter_todo/modules/dashboard/domain/repositories/i_task_repository.dart';

/// Interface do Usecase para criar uma tarefa
///
abstract class ICreateTaskUsecase {
  Future<void> call(TaskEntity taskEntity);
}

/// Implementação do Usecase para criar uma tarefa. Executa a inserção do item em um armazenamento.
///
/// Injetamos o repositório no construtor para seguir os princípios de arquitetura limpa e invertemos a dependência (Princípios SOLID).
///
class CreateTaskUsecaseImpl implements ICreateTaskUsecase {
  CreateTaskUsecaseImpl(this._taskRepository);

  final ITaskRepository _taskRepository;

  @override
  Future<void> call(TaskEntity taskEntity) async {
    return await _taskRepository.create(taskEntity);
  }
}
