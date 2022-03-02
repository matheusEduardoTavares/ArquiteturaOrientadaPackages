import 'package:flutter/material.dart';
import 'package:web/app/core/utilities/strings.dart';

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({ 
    required this.title,
    Key? key
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(Strings.confirmation),
      content: Text('${Strings.cofirmExclude} "$title" ?'),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          }, 
          child: const Text(Strings.cancel),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          }, 
          child: const Text(Strings.confirm),
        ),
      ],
    );
  }
}