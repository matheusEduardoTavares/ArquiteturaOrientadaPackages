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
    required RemoveTodolistsUsecase removeTodolistsUsecase,
  }) : 
  _getTodolistsUsecase = getTodolistsUsecase,
  _updateTodolistsUsecase = updateTodolistsUsecase,
  _removeTodolistsUsecase = removeTodolistsUsecase,
  super(TodolistState.initial());

  final GetTodolistsUsecase _getTodolistsUsecase;
  final UpdateTodolistsUsecase _updateTodolistsUsecase;
  final RemoveTodolistsUsecase _removeTodolistsUsecase;

  Future<void> getTodolists() async {
    _treatMethods(
      errorMessage: 'Ocorreu um erro ao tentar baixar os todos',
      executeMethod: () async {
        await _getAndUpdateTodolist();
      }
    );
  }

  Future<void> updateTodolistIsVisited({
    required TodolistModel updatedModel,
    required bool isVisited,
  }) async {
    _treatMethods(
      errorMessage: 'Ocorreu um erro ao atualizar o todo',
      executeMethod: () async {
        await _updateTodolistsUsecase.execute(updatedModel.copyWith(
          isVisited: isVisited
        ));
        
        await _getAndUpdateTodolist();
      }
    );
  }

  Future<void> removeTodolist({
    required TodolistModel modelToRemove,
  }) async {
    _treatMethods(
      errorMessage: 'Ocorreu um erro ao deletar o todo',
      executeMethod: () async {
        await _removeTodolistsUsecase.execute(modelToRemove);
      
        await _getAndUpdateTodolist();
      }
    );
  }

  Future<void> _getAndUpdateTodolist() async {
    final getData = await _getTodolistsUsecase.execute();

    emit(state.copyWith(
      items: getData,
    ));
  }
  
  Future<void> _treatMethods({
    required String errorMessage,
    required Future<void> Function() executeMethod,
  }) async {
    try {
      emit(state.copyWith(isRequesting: true));
      
      await executeMethod();
    } 
    catch (_) {
      WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
        asuka.showDialog(
          builder: (_) => ErrorDialog(
            content: errorMessage,
          ),
        );
      });
    }
    finally {
      emit(state.copyWith(isRequesting: false));
    }
  }
}