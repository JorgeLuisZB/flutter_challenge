import 'package:flutter/material.dart';

/// Defines the default light theme in all the app
var themeLight = ThemeData(
  /// Defines the default brightness and colors.
  brightness: Brightness.light,
  primaryColorDark: Color.fromRGBO(53, 83, 150, 1),
  primaryColor: Color.fromRGBO(60, 94, 169, 1),
  accentColor: Color.fromRGBO(85, 195, 161, 1),

  /// Defines the default font family.
  fontFamily: 'Hind',

  /// Defines the default AppBarTheme.
  appBarTheme: const AppBarTheme(brightness: Brightness.dark),

  /// Defines the default TextTheme.
  textTheme: const TextTheme(
    bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
  ),
);
