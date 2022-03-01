import 'package:bloc/bloc.dart';
import 'package:business_layer/business_layer.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile/app/core/dialogs/error_dialog.dart';
import 'package:mobile/app/modules/todolist/presenter/todolist_state.dart';
import 'package:asuka/asuka.dart' as asuka;

class TodolistController extends Cubit<TodolistState> {
  TodolistController({
    required GetTodolistsUsecase getTodolistsUsecase,
    required UpdateTodolistsUsecase updateTodolistsUsecase,
  }) : 
  _getTodolistsUsecase = getTodolistsUsecase,
  _updateTodolistsUsecase = updateTodolistsUsecase,
  super(TodolistState.initial());

  final GetTodolistsUsecase _getTodolistsUsecase;
  final UpdateTodolistsUsecase _updateTodolistsUsecase;

  Future<void> getTodolists() async {
    try {
      emit(state.copyWith(isRequesting: true));
      
      await _getAndUpdateTodolist();
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

  Future<void> updateTodolistIsVisited({
    required TodolistModel updatedModel,
    required bool isVisited,
  }) async {
    try {
      emit(state.copyWith(isRequesting: true));
      
      await _updateTodolistsUsecase.execute(updatedModel.copyWith(
        isVisited: isVisited
      ));
      
      await _getAndUpdateTodolist();
    } 
    catch (_) {
      WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
        asuka.showDialog(
          builder: (_) => const ErrorDialog(
            content: 'Ocorreu um erro ao atualizar os todos',
          ),
        );
      });
    }
    finally {
      emit(state.copyWith(isRequesting: false));
    }
  }

  Future<void> _getAndUpdateTodolist() async {
    final getData = await _getTodolistsUsecase.execute();

    emit(state.copyWith(
      items: getData,
    ));
  }
}