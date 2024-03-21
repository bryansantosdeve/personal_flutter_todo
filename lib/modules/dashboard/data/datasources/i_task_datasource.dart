import 'package:dartz/dartz.dart';
import 'package:personal_flutter_todo/modules/dashboard/core/entities/task_entity.dart';

abstract class ITaskDatasource {
  Future<Either<Exception, void>> create(TaskEntity domain);

  Future<Either<Exception, List<TaskEntity>>> getAll();
}
