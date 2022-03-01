import 'package:business_layer/app/modules/todolist/todolist_module_adapter.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobile/app/core/utilities/routes_name.dart';
import 'package:mobile/app/modules/todolist/presenter/todolist_controller.dart';
import 'package:mobile/app/modules/todolist/ui/create/todolist_create_page.dart';
import 'package:mobile/app/modules/todolist/ui/todolist_page.dart';

class TodolistModule extends Module {

  @override
  final List<Bind> binds = [
    ...TodoListModuleAdapter.binds(),
    Bind.lazySingleton((i) => TodolistController(
      createTodolistsUsecase: i(),
      removeTodolistsUsecase: i(),
      updateTodolistsUsecase: i(),
      getTodolistsUsecase: i(),
    )),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute, 
      child: (_, args) => TodoListPage(controller: Modular.get(),)
    ),
    ChildRoute(
      RoutesName.createTodolistItemRoute, 
      child: (_, args) => TodolistCreatePage(controller: Modular.get()),
    )
  ];
}