import 'package:flutter/material.dart';
import 'package:web/app/core/utilities/constants.dart';

class DefaultContainerTodolistItem extends StatelessWidget {
  const DefaultContainerTodolistItem({ 
    required this.color,
    this.child,
    Key? key
  }) : super(key: key);

  final Color color;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Constants.defaultTodolistItemHeight,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(
          Constants.defaultBorderRadius
        )
      ),
      child: child,
    );
  }
}