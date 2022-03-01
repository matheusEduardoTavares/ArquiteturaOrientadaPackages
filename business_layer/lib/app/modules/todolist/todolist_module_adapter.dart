import 'package:business_layer/app/modules/todolist/data/datasources/get_todolists_datasource_impl.dart';
import 'package:business_layer/app/modules/todolist/domain/repositories/get_todolists_repository.dart';
import 'package:business_layer/app/modules/todolist/domain/usecases/get_todolists_usecase_impl.dart';
import 'package:business_layer/app/modules/todolist/infra/datasources/get_todolists_datasource.dart';
import 'package:business_layer/app/modules/todolist/infra/repositories/get_todolists_repository_impl.dart';
import 'package:business_layer/app/modules/todolist/presenter/usecases/get_todolists_usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TodoListModuleAdapter {
  TodoListModuleAdapter._();

  List<Bind> binds() => [
    Bind.lazySingleton<GetTodolistsDatasource>((i) => GetTodolistsDatasourceImpl(localStorage: i(), restClient: i()), export: true),
    Bind.lazySingleton<GetTodolistsRepository>((i) => GetTodolistsRepositoryImpl(getTodolistsDatasource: i()), export: true),
    Bind.lazySingleton<GetTodolistsUsecase>((i) => GetTodolistsUsecaseImpl(getTodolistsRepository: i()), export: true),
  ];
}