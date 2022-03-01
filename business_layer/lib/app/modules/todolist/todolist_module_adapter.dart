import 'package:business_layer/app/modules/todolist/data/datasources/create_todolists_datasource_impl.dart';
import 'package:business_layer/app/modules/todolist/data/datasources/get_todolists_datasource_impl.dart';
import 'package:business_layer/app/modules/todolist/data/datasources/remove_todolists_datasource_impl.dart';
import 'package:business_layer/app/modules/todolist/data/datasources/update_todolists_datasource_impl.dart';
import 'package:business_layer/app/modules/todolist/domain/repositories/create_todolists_repository.dart';
import 'package:business_layer/app/modules/todolist/domain/repositories/get_todolists_repository.dart';
import 'package:business_layer/app/modules/todolist/domain/repositories/remove_todolists_repository.dart';
import 'package:business_layer/app/modules/todolist/domain/repositories/update_todolists_repository.dart';
import 'package:business_layer/app/modules/todolist/domain/usecases/create_todolists_usecase_impl.dart';
import 'package:business_layer/app/modules/todolist/domain/usecases/get_todolists_usecase_impl.dart';
import 'package:business_layer/app/modules/todolist/domain/usecases/remove_todolists_usecase_impl.dart';
import 'package:business_layer/app/modules/todolist/domain/usecases/update_todolists_usecase_impl.dart';
import 'package:business_layer/app/modules/todolist/infra/datasources/create_todolists_datasource.dart';
import 'package:business_layer/app/modules/todolist/infra/datasources/get_todolists_datasource.dart';
import 'package:business_layer/app/modules/todolist/infra/datasources/remove_todolists_datasource.dart';
import 'package:business_layer/app/modules/todolist/infra/datasources/update_todolists_datasource.dart';
import 'package:business_layer/app/modules/todolist/infra/repositories/create_todolists_repository_impl.dart';
import 'package:business_layer/app/modules/todolist/infra/repositories/get_todolists_repository_impl.dart';
import 'package:business_layer/app/modules/todolist/infra/repositories/remove_todolists_repository_impl.dart';
import 'package:business_layer/app/modules/todolist/infra/repositories/update_todolists_repository_impl.dart';
import 'package:business_layer/business_layer.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TodoListModuleAdapter {
  TodoListModuleAdapter._();

  static List<Bind> binds() => [
    //CREATE
    Bind.lazySingleton<CreateTodolistsDatasource>((i) => CreateTodolistsDatasourceImpl(restClient: i())),
    Bind.lazySingleton<CreateTodolistsUsecase>((i) => CreateTodolistsUsecaseImpl(createTodolistsRepository: i())),
    Bind.lazySingleton<CreateTodolistsRepository>((i) => CreateTodolistsRepositoryImpl(createTodolistsDatasource: i())),

    //DELETE
    Bind.lazySingleton<RemoveTodolistsDatasource>((i) => RemoveTodolistsDatasourceImpl(restClient: i())),
    Bind.lazySingleton<RemoveTodolistsUsecase>((i) => RemoveTodolistsUsecaseImpl(removeTodolistsRepository: i())),
    Bind.lazySingleton<RemoveTodolistsRepository>((i) => RemoveTodolistsRepositoryImpl(removeTodolistsDatasource: i())),

    //UPDATE
    Bind.lazySingleton<UpdateTodolistsDatasource>((i) => UpdateTodolistsDatasourceImpl(restClient: i())),
    Bind.lazySingleton<UpdateTodolistsUsecase>((i) => UpdateTodolistsUsecaseImpl(updateTodolistsRepository: i())),
    Bind.lazySingleton<UpdateTodolistsRepository>((i) => UpdateTodolistsRepositoryImpl(updateTodolistsDatasource: i())),

    //GET
    Bind.lazySingleton<GetTodolistsDatasource>((i) => GetTodolistsDatasourceImpl(restClient: i()), export: true),
    Bind.lazySingleton<GetTodolistsRepository>((i) => GetTodolistsRepositoryImpl(getTodolistsDatasource: i()), export: true),
    Bind.lazySingleton<GetTodolistsUsecase>((i) => GetTodolistsUsecaseImpl(getTodolistsRepository: i()), export: true),
  ];
}