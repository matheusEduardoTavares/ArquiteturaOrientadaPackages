import 'package:business_layer/app/modules/todolist/domain/entities/todolist_model.dart';
import 'package:business_layer/app/modules/todolist/domain/repositories/create_todolists_repository.dart';
import 'package:business_layer/app/modules/todolist/infra/datasources/create_todolists_datasource.dart';

class CreateTodolistsRepositoryImpl implements CreateTodolistsRepository {
  CreateTodolistsRepositoryImpl({
    required CreateTodolistsDatasource createTodolistsDatasource,
  }) : _createTodolistsDatasource = createTodolistsDatasource;

  final CreateTodolistsDatasource _createTodolistsDatasource;

  @override
  Future<void> execute(TodolistModel modelToCreate) => 
    _createTodolistsDatasource.execute(modelToCreate);
}