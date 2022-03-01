import 'package:business_layer/app/modules/todolist/domain/entities/todolist_model.dart';
import 'package:business_layer/app/modules/todolist/domain/repositories/get_todolists_repository.dart';
import 'package:business_layer/app/modules/todolist/presenter/usecases/get_todolists_usecase.dart';

class GetTodolistsUsecaseImpl implements GetTodolistsUsecase {
  GetTodolistsUsecaseImpl({
    required GetTodolistsRepository getTodolistsRepository
  }) : _getTodolistsRepository = getTodolistsRepository;

  final GetTodolistsRepository _getTodolistsRepository;

  @override
  Future<List<TodolistModel>> execute() => _getTodolistsRepository.execute();
}