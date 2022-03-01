import 'package:business_layer/app/modules/todolist/domain/entities/todolist_model.dart';

abstract class GetTodolistsDatasource {
  Future<List<TodolistModel>> execute();
}