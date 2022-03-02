import 'package:business_layer/business_layer.dart';
import 'package:flutter/material.dart';
import 'package:web/app/core/utilities/constants.dart';
import 'package:web/app/core/utilities/default_colors.dart';
import 'package:web/app/core/utilities/widgets_utilities.dart';
import 'package:web/app/modules/todolist/presenter/todolist_controller.dart';
import 'package:web/app/modules/todolist/ui/widgets/default_container_todolist_item.dart';
import 'package:web/app/modules/todolist/ui/widgets/todolist_image_item.dart';

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
        color: DefaultColors.lightGrey,
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
                        padding: const EdgeInsets.fromLTRB(
                          Constants.defaultSymmetricPadding, 
                          Constants.defaultSymmetricPadding, 
                          Constants.defaultSymmetricPadding, 
                          Constants.defaultSpacePadding
                        ),
                        child: Text(
                          model.title,
                          style: const TextStyle(
                            fontSize: Constants.defaultFontSize,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Constants.defaultSymmetricPadding,
                      ),
                      child: SizedBox(
                        width: constraints.maxWidth - Constants.defaultTodolistItemWidthEmptyArea,
                        child: Text(
                          model.description,
                          style: const TextStyle(
                            fontSize: Constants.defaultNormalFontSize,
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