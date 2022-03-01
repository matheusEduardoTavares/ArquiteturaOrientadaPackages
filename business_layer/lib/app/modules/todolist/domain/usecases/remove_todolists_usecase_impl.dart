import 'package:business_layer/app/modules/todolist/domain/entities/todolist_model.dart';
import 'package:business_layer/app/modules/todolist/domain/repositories/remove_todolists_repository.dart';
import 'package:business_layer/app/modules/todolist/presenter/usecases/remove_todolists_usecase.dart';

class RemoveTodolistsUsecaseImpl implements RemoveTodolistsUsecase {
  RemoveTodolistsUsecaseImpl({
    required RemoveTodolistsRepository removeTodolistsRepository
  }) : _removeTodolistsRepository = removeTodolistsRepository;

  final RemoveTodolistsRepository _removeTodolistsRepository;

  @override
  Future<void> execute(TodolistModel modelToRemove) => 
    _removeTodolistsRepository.execute(modelToRemove);
}