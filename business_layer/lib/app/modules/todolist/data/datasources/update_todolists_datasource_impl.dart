import 'package:business_layer/app/core/rest_client/rest_client.dart';
import 'package:business_layer/app/modules/todolist/domain/entities/todolist_model.dart';
import 'package:business_layer/app/modules/todolist/infra/datasources/update_todolists_datasource.dart';

class UpdateTodolistsDatasourceImpl implements UpdateTodolistsDatasource {
  UpdateTodolistsDatasourceImpl({
    required RestClient restClient,
  }) : _restClient = restClient;

  final RestClient _restClient;

  @override
  Future<void> execute(TodolistModel updatedModel) async {
    await _restClient.put(
      path: '/todo-list/${updatedModel.id}',
      data: updatedModel.toJson(),
    );
  }
}