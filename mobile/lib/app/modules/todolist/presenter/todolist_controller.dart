import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:business_layer/business_layer.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobile/app/core/dialogs/error_dialog.dart';
import 'package:mobile/app/modules/todolist/presenter/todolist_state.dart';
import 'package:asuka/asuka.dart' as asuka;

class TodolistController extends Cubit<TodolistState> {
  TodolistController({
    required GetTodolistsUsecase getTodolistsUsecase,
    required UpdateTodolistsUsecase updateTodolistsUsecase,
    required RemoveTodolistsUsecase removeTodolistsUsecase,
    required CreateTodolistsUsecase createTodolistsUsecase,
    required FilterTodolistsByTitleUsecase filterTodolistsByTitleUsecase,
  }) : 
  _getTodolistsUsecase = getTodolistsUsecase,
  _updateTodolistsUsecase = updateTodolistsUsecase,
  _removeTodolistsUsecase = removeTodolistsUsecase,
  _createTodolistsUsecase = createTodolistsUsecase,
  _filterTodolistsByTitleUsecase = filterTodolistsByTitleUsecase,
  super(TodolistState.initial());

  final GetTodolistsUsecase _getTodolistsUsecase;
  final UpdateTodolistsUsecase _updateTodolistsUsecase;
  final RemoveTodolistsUsecase _removeTodolistsUsecase;
  final CreateTodolistsUsecase _createTodolistsUsecase;
  final FilterTodolistsByTitleUsecase _filterTodolistsByTitleUsecase;

  Timer? _timer;
  TextEditingController? _filterEC;

  TextEditingController? get filterEC => _filterEC;

  void initializeTimerAndTextEditingController() {
    _filterEC = TextEditingController();
    _filterEC!.addListener(() {
      if (_timer?.isActive ?? false) {
        _timer!.cancel();
      }

      _timer = Timer(
        const Duration(milliseconds: 500),
        () {
          filterTodolistItems(_filterEC!.text);
        }
      );
    });
  }

  void disposeTimerAndTextEditingController() {
    _filterEC?.removeListener(() {});
    _filterEC?.dispose();
    _filterEC = null;
    _timer?.cancel();
    _timer = null;
  }

  void _cancelTimerAndClearTextEditingController() {
    _timer?.cancel();
    _filterEC?.clear();
  }

  void filterTodolistItems(String text) {
    final filtered = _filterTodolistsByTitleUsecase.execute(
      allItems: state.allItems, 
      titleToFilter: text,
    );

    emit(state.copyWith(
      itemsToShow: filtered,
    ));
  }

  Future<void> clearFilterTodolistItems(TextEditingController textEditingController) async {
    await getTodolists();
  }

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
  Future<void> _createTodolistItem({
    required TodolistModel modelToCreate,
  }) async {
    _treatMethods(
      errorMessage: 'Ocorreu um erro ao criar o todo',
      executeMethod: () async {
        await _createTodolistsUsecase.execute(modelToCreate);
      
        await _getAndUpdateTodolist();
      }
    );
  }

  Future<void> _getAndUpdateTodolist() async {
    _cancelTimerAndClearTextEditingController();
    final getData = await _getTodolistsUsecase.execute();

    emit(state.copyWith(
      itemsToShow: getData,
      allItems: [ ...getData ],
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

  Future<void> validateAndCreateTodolistItem({
    required GlobalKey<FormState> formKey,
    required String imageUrl,
    required String title,
    required String description,
  }) async {
    if (formKey.currentState?.validate() ?? false) {
      final modelToCreate = TodolistModel(
        image: imageUrl, 
        title: title, 
        description: description, 
        isVisited: false, 
      );

      await _createTodolistItem(modelToCreate: modelToCreate);

      Modular.to.pop();
    }
  }
}