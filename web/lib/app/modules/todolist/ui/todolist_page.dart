import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:web/app/core/utilities/routes_name.dart';
import 'package:web/app/modules/todolist/presenter/todolist_controller.dart';
import 'package:web/app/modules/todolist/presenter/todolist_state.dart';
import 'package:web/app/modules/todolist/ui/widgets/todolist_filter_content.dart';

class TodolistPage extends StatelessWidget {
  const TodolistPage({ 
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
          todolistItems: state.itemsToShow,
          controller: _controller,
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Modular.to.pushNamed(RoutesName.createTodolistItemRoute);
          },
        ),
      ),
    );
  }
}