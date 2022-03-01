import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/app/modules/todolist/presenter/todolist_controller.dart';
import 'package:mobile/app/modules/todolist/presenter/todolist_state.dart';
import 'package:mobile/app/modules/todolist/ui/widgets/todolist_filter_content.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({ 
    Key? key,
    required TodolistController todolistController,
  }) : 
  _todolistController = todolistController,
  super(key: key);

  final TodolistController _todolistController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodolistController, TodolistState>(
      bloc: _todolistController..getTodolists(),
      builder: (_, state) => Scaffold(
        body: state.isRequesting ? const Center(
          child: CircularProgressIndicator(),
        ) : TodolistFilterContent(
          todolistItems: state.items,
        ),
      ),
    );
  }
}