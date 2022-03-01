import 'package:business_layer/app/modules/todolist/domain/entities/todolist_model.dart';

abstract class RemoveTodolistsRepository {
  Future<void> execute(TodolistModel modelToRemove);
}