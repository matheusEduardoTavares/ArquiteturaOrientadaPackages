import 'package:business_layer/business_layer.dart';

abstract class CreateTodolistsUsecase {
  Future<void> execute(TodolistModel modelToCreate);
}