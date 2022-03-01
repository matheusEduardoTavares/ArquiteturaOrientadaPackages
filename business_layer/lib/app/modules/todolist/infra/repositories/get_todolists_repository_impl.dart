import 'package:business_layer/app/modules/todolist/domain/entities/todolist_model.dart';
import 'package:business_layer/app/modules/todolist/domain/repositories/get_todolists_repository.dart';
import 'package:business_layer/app/modules/todolist/infra/datasources/get_todolists_datasource.dart';

class GetTodolistsRepositoryImpl implements GetTodolistsRepository {
  GetTodolistsRepositoryImpl({
    required GetTodolistsDatasource getTodolistsDatasource,
  }) : _getTodolistsDatasource = getTodolistsDatasource;

  final GetTodolistsDatasource _getTodolistsDatasource;

  @override
  Future<List<TodolistModel>> execute() => _getTodolistsDatasource.execute();
}