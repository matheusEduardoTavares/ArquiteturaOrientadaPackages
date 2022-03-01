import 'package:business_layer/business_layer.dart';
import 'package:flutter/material.dart';
import 'package:mobile/app/modules/todolist/presenter/todolist_controller.dart';

class TodolistImageItem extends StatelessWidget {
  const TodolistImageItem({ 
    required this.model,
    required TodolistController controller,
    Key? key
  }) : 
  _controller = controller,
  super(key: key);

  final TodolistModel model;
  final TodolistController _controller;

  @override
  Widget build(BuildContext context) {
    final content = Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      height: 170,
      width: 120,
      child: InkWell(
        onTap: () {
          final newStatus = !model.isVisited;
          _controller.updateTodolistIsVisited(
            updatedModel: model,
            isVisited: newStatus,
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image.network(
            model.image,
            fit: BoxFit.cover,
            loadingBuilder: (_, widget, loadingProgress) {
              if (loadingProgress == null) {
                return widget;
              }

              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );

    if (model.isVisited) {
      return Banner(
        location: BannerLocation.topEnd,
        message: 'Already Visited',
        child: content,
      );
    }

    return content;
  }
}