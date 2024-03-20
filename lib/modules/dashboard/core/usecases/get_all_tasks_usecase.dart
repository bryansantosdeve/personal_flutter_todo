import 'package:dartz/dartz.dart';
import 'package:personal_flutter_todo/modules/dashboard/core/entities/task_entity.dart';
import 'package:personal_flutter_todo/modules/dashboard/core/repositories/i_task_repository.dart';

/// Interface do Usecase para recuperar uma tarefa
///
abstract class IGetAllTasksUsecase {
  Future<Either<Exception, List<TaskEntity>>> call();
}

/// Implementação do Usecase para recuperar todas as tarefas existentes.
///
/// Injetamos o repositório no construtor para seguir os princípios de arquitetura limpa e invertemos a dependência (Princípios SOLID).
///
class GetAllTasksUsecaseImpl implements IGetAllTasksUsecase {
  GetAllTasksUsecaseImpl(this._repository);

  final ITaskRepository _repository;

  @override
  Future<Either<Exception, List<TaskEntity>>> call() async {
    try {
      final result = await _repository.getAll();

      /// TODO: Aprofundar estudo em uso do método fold baseado na documentação.
      return result.fold(
          (exception) => Left(exception), (domainList) => Right(domainList));
    } on Exception catch (exception) {
      return Left(exception);
    }
  }
}
