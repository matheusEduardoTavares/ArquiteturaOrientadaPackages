import 'package:business_layer/app/modules/todolist/domain/entities/todolist_model.dart';
import 'package:business_layer/app/modules/todolist/domain/repositories/remove_todolists_repository.dart';
import 'package:business_layer/app/modules/todolist/infra/datasources/remove_todolists_datasource.dart';

class RemoveTodolistsRepositoryImpl implements RemoveTodolistsRepository {
  RemoveTodolistsRepositoryImpl({
    required RemoveTodolistsDatasource removeTodolistsDatasource,
  }) : _removeTodolistsDatasource = removeTodolistsDatasource;

  final RemoveTodolistsDatasource _removeTodolistsDatasource;

  @override
  Future<void> execute(TodolistModel modelToRemove) => 
    _removeTodolistsDatasource.execute(modelToRemove);
}