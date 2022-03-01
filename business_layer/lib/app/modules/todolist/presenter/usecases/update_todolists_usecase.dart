import 'package:business_layer/business_layer.dart';

abstract class UpdateTodolistsUsecase {
  Future<void> execute(TodolistModel updatedModel);
}