import 'package:business_layer/business_layer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobile/app/app_module.dart';
import 'package:mobile/app/app_widget.dart';

Future<void> main() async {
  await SetupApplication.initialize();

  runApp(
    ModularApp(
      module: AppModule(), 
      child: const AppWidget(),
    ),
  );
}