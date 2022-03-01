import 'package:business_layer/app/core/rest_client/rest_client.dart';
import 'package:business_layer/app/modules/todolist/domain/entities/todolist_model.dart';
import 'package:business_layer/app/modules/todolist/infra/datasources/create_todolists_datasource.dart';

class CreateTodolistsDatasourceImpl implements CreateTodolistsDatasource {
  CreateTodolistsDatasourceImpl({
    required RestClient restClient,
  }) : _restClient = restClient;

  final RestClient _restClient;

  @override
  Future<void> execute(TodolistModel modelToCreate) async {
    await _restClient.post(
      path: '/todo-list',
      data: modelToCreate.toJson(),
    );
  }
}