import 'package:flutter/material.dart';

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({ 
    required this.title,
    Key? key
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Confirmação'),
      content: Text('Deseja deletar o todo de $title ?'),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          }, 
          child: const Text('CANCELAR'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          }, 
          child: const Text('CONFIRMAR'),
        ),
      ],
    );
  }
}