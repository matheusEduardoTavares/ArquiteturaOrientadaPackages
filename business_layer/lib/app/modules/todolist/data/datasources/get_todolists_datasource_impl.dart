import 'package:business_layer/app/core/rest_client/rest_client.dart';
import 'package:business_layer/app/modules/todolist/domain/entities/todolist_model.dart';
import 'package:business_layer/app/modules/todolist/infra/datasources/get_todolists_datasource.dart';

class GetTodolistsDatasourceImpl implements GetTodolistsDatasource {
  GetTodolistsDatasourceImpl({
    required RestClient restClient,
  }) : _restClient = restClient;

  final RestClient _restClient;

  static const todoListKey = 'todoListKey';

  @override
  Future<List<TodolistModel>> execute() async {
    final restClientResponse = await _restClient.get<List>(
      path: '/todo-list',
    );

    final List<Map<String, dynamic>>? todoListItems = restClientResponse.data?.
      map((e) => Map<String, dynamic>.from(e)).toList();

    if (todoListItems != null && todoListItems.isNotEmpty) {
      return todoListItems.map(
        (e) => TodolistModel.fromMap(e),
      ).toList();
    }

    return <TodolistModel>[];
  }
}