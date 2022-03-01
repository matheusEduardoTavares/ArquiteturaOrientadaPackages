import 'package:business_layer/business_layer.dart';
import 'package:flutter/material.dart';

class TodolistImageItem extends StatelessWidget {
  const TodolistImageItem({ 
    required this.model,
    Key? key
  }) : super(key: key);

  final TodolistModel model;

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
          print('CLICADO');
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
        message: 'Já visitado',
        child: content,
      );
    }

    return content;
  }
}