import 'package:business_layer/app/modules/todolist/data/datasources/get_todolists_datasource_impl.dart';
import 'package:business_layer/app/modules/todolist/data/datasources/update_todolists_datasource_impl.dart';
import 'package:business_layer/app/modules/todolist/domain/repositories/get_todolists_repository.dart';
import 'package:business_layer/app/modules/todolist/domain/repositories/update_todolists_repository.dart';
import 'package:business_layer/app/modules/todolist/domain/usecases/get_todolists_usecase_impl.dart';
import 'package:business_layer/app/modules/todolist/domain/usecases/update_todolists_usecase_impl.dart';
import 'package:business_layer/app/modules/todolist/infra/datasources/get_todolists_datasource.dart';
import 'package:business_layer/app/modules/todolist/infra/datasources/update_todolists_datasource.dart';
import 'package:business_layer/app/modules/todolist/infra/repositories/get_todolists_repository_impl.dart';
import 'package:business_layer/app/modules/todolist/infra/repositories/update_todolists_repository_impl.dart';
import 'package:business_layer/business_layer.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TodoListModuleAdapter {
  TodoListModuleAdapter._();

  static List<Bind> binds() => [
    //UPDATE
    Bind.lazySingleton<UpdateTodolistsDatasource>((i) => UpdateTodolistsDatasourceImpl(restClient: i())),
    Bind.lazySingleton<UpdateTodolistsUsecase>((i) => UpdateTodolistsUsecaseImpl(updateTodolistsRepository: i())),
    Bind.lazySingleton<UpdateTodolistsRepository>((i) => UpdateTodolistsRepositoryImpl(updateTodolistsDatasource: i())),

    //GET
    Bind.lazySingleton<GetTodolistsDatasource>((i) => GetTodolistsDatasourceImpl(localStorage: i(), restClient: i()), export: true),
    Bind.lazySingleton<GetTodolistsRepository>((i) => GetTodolistsRepositoryImpl(getTodolistsDatasource: i()), export: true),
    Bind.lazySingleton<GetTodolistsUsecase>((i) => GetTodolistsUsecaseImpl(getTodolistsRepository: i()), export: true),
  ];
}