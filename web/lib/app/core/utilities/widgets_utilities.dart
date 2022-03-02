import 'package:flutter/widgets.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:web/app/core/dialogs/confirm_dialog.dart';

class WidgetsUtilities {
  WidgetsUtilities._();

  static Future<bool?> confirmDismiss ({
    required DismissDirection direction,
    required String todoTitle,
  }) async {
    return asuka.showDialog<bool?>(
      builder: (_) => ConfirmDialog(
        title: todoTitle,
      ),
    );
  }  
}