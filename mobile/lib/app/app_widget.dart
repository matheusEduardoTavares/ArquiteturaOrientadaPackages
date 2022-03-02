import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:mobile/app/core/utilities/constants.dart';
import 'package:mobile/app/core/utilities/default_colors.dart';

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
          primary: DefaultColors.purple,
          onPrimary: Colors.white,
          secondary: Colors.purple,
          onSecondary: Colors.white,
          background: Colors.transparent,
          onBackground: Colors.transparent,
          brightness: Brightness.light,
          error: Colors.red,
          onError: Colors.grey,
          surface: Colors.purpleAccent,
          onSurface: Colors.grey,
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Constants.defaultBorderRadius),
            borderSide: BorderSide.none
          ),
          filled: true,
          fillColor: DefaultColors.lightGrey,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: DefaultColors.purple,
        )
      ),
    );
  }
}