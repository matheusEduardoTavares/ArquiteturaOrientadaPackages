import 'package:business_layer/app/modules/todolist/domain/entities/todolist_model.dart';
import 'package:business_layer/app/modules/todolist/domain/repositories/update_todolists_repository.dart';
import 'package:business_layer/app/modules/todolist/presenter/usecases/update_todolists_usecase.dart';

class UpdateTodolistsUsecaseImpl implements UpdateTodolistsUsecase {
  UpdateTodolistsUsecaseImpl({
    required UpdateTodolistsRepository updateTodolistsRepository
  }) : _updateTodolistsRepository = updateTodolistsRepository;

  final UpdateTodolistsRepository _updateTodolistsRepository;

  @override
  Future<void> execute(TodolistModel updatedModel) => 
    _updateTodolistsRepository.execute(updatedModel);
}