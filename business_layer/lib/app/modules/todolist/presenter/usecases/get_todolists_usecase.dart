import 'package:business_layer/app/modules/todolist/domain/entities/todolist_model.dart';

abstract class GetTodolistsUsecase {
  Future<List<TodolistModel>> execute();
}