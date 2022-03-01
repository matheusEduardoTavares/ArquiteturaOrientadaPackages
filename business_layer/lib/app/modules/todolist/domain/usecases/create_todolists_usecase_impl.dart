import 'package:business_layer/app/modules/todolist/domain/entities/todolist_model.dart';
import 'package:business_layer/app/modules/todolist/domain/repositories/create_todolists_repository.dart';
import 'package:business_layer/app/modules/todolist/presenter/usecases/create_todolists_usecase.dart';

class CreateTodolistsUsecaseImpl implements CreateTodolistsUsecase {
  CreateTodolistsUsecaseImpl({
    required CreateTodolistsRepository createTodolistsRepository
  }) : _createTodolistsRepository = createTodolistsRepository;

  final CreateTodolistsRepository _createTodolistsRepository;

  @override
  Future<void> execute(TodolistModel modelToCreate) => 
    _createTodolistsRepository.execute(modelToCreate);
}