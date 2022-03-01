import 'package:flutter/material.dart';

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
      height: 170,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20)
      ),
      child: child,
    );
  }
}