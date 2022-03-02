import 'package:business_layer/business_layer.dart';
import 'package:flutter/material.dart';
import 'package:mobile/app/core/utilities/widgets_utilities.dart';
import 'package:mobile/app/modules/todolist/presenter/todolist_controller.dart';
import 'package:mobile/app/modules/todolist/ui/widgets/default_container_todolist_item.dart';
import 'package:mobile/app/modules/todolist/ui/widgets/todolist_image_item.dart';

class TodolistFilterItem extends StatelessWidget {
  const TodolistFilterItem({ 
    required this.model,
    required this.index,
    required TodolistController controller,
    Key? key
  }) : 
  _controller = controller,
  super(key: key);

  final TodolistModel model;
  final TodolistController _controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey('$hashCode-$index'), 
      confirmDismiss: (dismissDirection) async {
        final confirmDismiss = await WidgetsUtilities.confirmDismiss(
          direction: dismissDirection, 
          todoTitle: model.title,
        );

        if (confirmDismiss != null && confirmDismiss) {
          _controller.removeTodolist(modelToRemove: model);
        }

        return confirmDismiss;
      },
      background: const DefaultContainerTodolistItem(
        color: Colors.black12,
      ),
      child: DefaultContainerTodolistItem(
        color: Colors.grey.withOpacity(0.1),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Row(
              children: [
                Column(
                  children: [
                    TodolistImageItem(
                      model: model,
                      controller: _controller,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                        child: Text(
                          model.title,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: SizedBox(
                        width: constraints.maxWidth - 160,
                        child: Text(
                          model.description,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          }
        ),
      )
    );
  }
}