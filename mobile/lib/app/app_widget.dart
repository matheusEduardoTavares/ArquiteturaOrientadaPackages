import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:asuka/asuka.dart' as asuka;

class AppWidget extends StatelessWidget {
  const AppWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: Modular.routeInformationParser, 
      routerDelegate: Modular.routerDelegate,
      title: 'mobile',
      builder: asuka.builder,
      theme: ThemeData(
        colorScheme: const ColorScheme(
          primary: Color.fromRGBO(128, 101, 235, 1),
          onPrimary: Colors.white,
          secondary: Colors.purple,
          onSecondary: Colors.grey,
          background: Colors.transparent,
          onBackground: Colors.transparent,
          brightness: Brightness.light,
          error: Colors.red,
          onError: Colors.grey,
          surface: Colors.purpleAccent,
          onSurface: Colors.grey,
        ),
      ),
    );
  }
}