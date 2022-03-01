import 'package:business_layer/business_layer.dart';
import 'package:flutter/material.dart';
import 'package:mobile/app/modules/todolist/ui/widgets/todolist_image_item.dart';

class TodolistFilterItem extends StatelessWidget {
  const TodolistFilterItem({ 
    required this.model,
    Key? key
  }) : super(key: key);

  final TodolistModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20)
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Row(
            children: [
              Column(
                children: [
                  TodolistImageItem(
                    model: model,
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
    );
  }
}