import 'package:business_layer/app/modules/todolist/domain/entities/todolist_model.dart';
import 'package:business_layer/app/modules/todolist/presenter/usecases/filter_todolists_by_title_usecase.dart';

class FilterTodolistsByTitleUsecaseImpl implements FilterTodolistsByTitleUsecase {
  @override
  List<TodolistModel> execute({required List<TodolistModel> allItems, required String titleToFilter}) {
    if (titleToFilter.isEmpty) {
      return allItems;
    }

    final itemsFiltered = allItems.where(
      (e) => e.title.toLowerCase().contains(titleToFilter.toLowerCase())
    ).toList();

    return itemsFiltered;
  }
  
}