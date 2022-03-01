import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/app/modules/todolist/presenter/todolist_controller.dart';
import 'package:mobile/app/modules/todolist/presenter/todolist_state.dart';
import 'package:mobile/app/modules/todolist/ui/widgets/todolist_filter_content.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({ 
    Key? key,
    required TodolistController controller,
  }) : 
  _controller = controller,
  super(key: key);

  final TodolistController _controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodolistController, TodolistState>(
      bloc: _controller..getTodolists(),
      builder: (_, state) => Scaffold(
        body: state.isRequesting ? const Center(
          child: CircularProgressIndicator(),
        ) : TodolistFilterContent(
          todolistItems: state.items,
          controller: _controller,
        ),
      ),
    );
  }
}