import 'package:dartz/dartz.dart';
import 'package:personal_flutter_todo/modules/dashboard/core/entities/task_entity.dart';

/// Classe abstrata do datasource que efetua a comunicação com serviços externos ou uso de bibliotecas. O datasource agrega a lógica de recebimento e envio de dados, sendo uma
/// das camadas mais externas da arquitetura.
///
abstract class ITaskDatasource {
  Future<Either<Exception, void>> create(TaskEntity domain);

  Future<Either<Exception, TaskEntity>> get(String key);
}
