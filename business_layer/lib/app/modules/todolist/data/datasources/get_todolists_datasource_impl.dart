import 'package:business_layer/app/core/local_storage/local_storage.dart';
import 'package:business_layer/app/core/rest_client/rest_client.dart';
import 'package:business_layer/app/modules/todolist/domain/entities/todolist_model.dart';
import 'package:business_layer/app/modules/todolist/infra/datasources/get_todolists_datasource.dart';
import 'package:dio/dio.dart';

class GetTodolistsDatasourceImpl implements GetTodolistsDatasource {
  GetTodolistsDatasourceImpl({
    required LocalStorage localStorage,
    required RestClient restClient,
  }) : _localStorage = localStorage,
    _restClient = restClient;

  final LocalStorage _localStorage;
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
      final convertedData = todoListItems.map(
        (e) => TodolistModel.fromMap(e),
      ).toList();

      final serializableData = convertedData.map((e) => e.toJson()).toList();

      await _localStorage.write<List>(todoListKey, serializableData);

      return convertedData;
    }

    return <TodolistModel>[];
  }
}