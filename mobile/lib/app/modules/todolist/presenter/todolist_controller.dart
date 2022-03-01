import 'package:bloc/bloc.dart';
import 'package:business_layer/business_layer.dart';
import 'package:mobile/app/modules/todolist/presenter/todolist_state.dart';

class TodolistController extends Cubit<TodolistState> {
  TodolistController({
    required GetTodolistsUsecase getTodolistsUsecase,
  }) : 
  _getTodolistsUsecase = getTodolistsUsecase,
  super(TodolistState.initial());

  final GetTodolistsUsecase _getTodolistsUsecase;

  Future<void> getTodolists() async {
    try {
      emit(state.copyWith(isRequesting: true));
      
      final getData = await _getTodolistsUsecase.execute();
      
      emit(state.copyWith(
        items: getData,
      ));
    } on Exception catch (e) {
      print('e = $e');
    }
    finally {
      emit(state.copyWith(isRequesting: false));
    }
  }
}