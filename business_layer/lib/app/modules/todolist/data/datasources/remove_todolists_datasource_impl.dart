import 'package:business_layer/app/core/rest_client/rest_client.dart';
import 'package:business_layer/app/modules/todolist/domain/entities/todolist_model.dart';
import 'package:business_layer/app/modules/todolist/infra/datasources/remove_todolists_datasource.dart';

class RemoveTodolistsDatasourceImpl implements RemoveTodolistsDatasource {
  RemoveTodolistsDatasourceImpl({
    required RestClient restClient,
  }) : _restClient = restClient;

  final RestClient _restClient;

  @override
  Future<void> execute(TodolistModel modelToRemove) async {
    await _restClient.delete(
      path: '/todo-list/${modelToRemove.id}',
    );
  }
}