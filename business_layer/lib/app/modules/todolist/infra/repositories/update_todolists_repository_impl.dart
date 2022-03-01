import 'package:business_layer/app/modules/todolist/domain/entities/todolist_model.dart';
import 'package:business_layer/app/modules/todolist/domain/repositories/update_todolists_repository.dart';
import 'package:business_layer/app/modules/todolist/infra/datasources/update_todolists_datasource.dart';

class UpdateTodolistsRepositoryImpl implements UpdateTodolistsRepository {
  UpdateTodolistsRepositoryImpl({
    required UpdateTodolistsDatasource updateTodolistsDatasource,
  }) : _updateTodolistsDatasource = updateTodolistsDatasource;

  final UpdateTodolistsDatasource _updateTodolistsDatasource;

  @override
  Future<void> execute(TodolistModel updatedModel) => _updateTodolistsDatasource.execute(updatedModel);
}