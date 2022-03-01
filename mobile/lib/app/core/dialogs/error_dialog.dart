import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({ 
    required this.content,
    Key? key
  }) : super(key: key);

  final String content;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Erro'),
      content: Text(content),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          }, 
          child: const Text('OK'),
        ),
      ],
    );
  }
}