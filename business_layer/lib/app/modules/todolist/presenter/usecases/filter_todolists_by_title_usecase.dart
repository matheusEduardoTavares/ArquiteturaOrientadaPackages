import 'package:business_layer/business_layer.dart';

abstract class FilterTodolistsByTitleUsecase {
  List<TodolistModel> execute({
    required List<TodolistModel> allItems,
    required String titleToFilter,
  });
}