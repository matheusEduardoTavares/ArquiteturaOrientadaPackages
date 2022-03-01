import 'package:business_layer/business_layer.dart';

abstract class RemoveTodolistsUsecase {
  Future<void> execute(TodolistModel modelToRemove);
}