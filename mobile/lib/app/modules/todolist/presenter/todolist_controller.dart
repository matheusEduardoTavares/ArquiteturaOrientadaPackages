import 'package:bloc/bloc.dart';
import 'package:business_layer/business_layer.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile/app/core/dialogs/error_dialog.dart';
import 'package:mobile/app/modules/todolist/presenter/todolist_state.dart';
import 'package:asuka/asuka.dart' as asuka;

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
    } 
    catch (_) {
      WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
        asuka.showDialog(
          builder: (_) => const ErrorDialog(
            content: 'Ocorreu um erro ao tentar baixar os todos',
          ),
        );
      });
    }
    finally {
      emit(state.copyWith(isRequesting: false));
    }
  }
}