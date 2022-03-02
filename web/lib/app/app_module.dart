import 'package:business_layer/app/core/core_module_adapter.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:web/app/modules/todolist/todolist_module.dart';

class AppModule extends Module {

  @override
  final List<Bind> binds = [
    ...CoreModuleAdapter.binds()
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(
      Modular.initialRoute, 
      module: TodolistModule()
    ),
  ];

}