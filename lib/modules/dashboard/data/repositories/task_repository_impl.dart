import 'package:dartz/dartz.dart';
import 'package:personal_flutter_todo/modules/dashboard/core/entities/task_entity.dart';
import 'package:personal_flutter_todo/modules/dashboard/core/repositories/i_task_repository.dart';

class TaskRepositoryImpl implements ITaskRepository {
  @override
  Future<Either<Exception, void>> create(TaskEntity domain) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, List<TaskEntity>>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }
}
