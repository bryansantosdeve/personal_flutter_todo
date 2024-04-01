import 'package:dartz/dartz.dart';
import 'package:json_cache/json_cache.dart';
import 'package:localstorage/localstorage.dart';

import 'package:personal_flutter_todo/modules/dashboard/core/entities/task_entity.dart';
import 'package:personal_flutter_todo/modules/dashboard/data/datasources/i_task_datasource.dart';
import 'package:personal_flutter_todo/modules/dashboard/data/models/task_model.dart';

/// Implementação do Datasource que representa a classe principal para persistir dados localmente na aplicação. Além disso, é responsável por administrar a conversão de dados entre
/// entidades e modelos do sistema.
///
class LocalTaskDatasourceImpl implements ITaskDatasource {
  LocalTaskDatasourceImpl(this._storage);
  final LocalStorage _storage;

  late JsonCache _jsonCacheLocalStorage;

  JsonCacheMem _init() {
    return JsonCacheMem(JsonCacheLocalStorage(_storage));
  }

  @override
  Future<Either<Exception, void>> create(TaskEntity domain) async {
    try {
      /// Inicializar a biblioteca e criar o arquivo json com os dados
      _jsonCacheLocalStorage = _init();

      final json = TaskModel.toJson(domain);

      /// Inserir dados no arquivo.
      await _jsonCacheLocalStorage.refresh(json['id'], json);
      return const Right(null);
    } on Exception catch (exception) {
      return Left(exception);
    }
  }

  @override
  Future<Either<Exception, TaskEntity>> get(String key) async {
    try {
      _jsonCacheLocalStorage = _init();

      final json = await _jsonCacheLocalStorage.value(key);

      if (json == null || json.isEmpty) {
        return Left(Exception());
      }

      final domain = TaskModel.fromJson(json);

      return Right(domain);
    } on Exception catch (exception) {
      return Left(exception);
    }
  }
}
