import 'package:flutter/material.dart';

final ThemeData theme = ThemeData();

final ThemeData appTheme = theme.copyWith(
  colorScheme: theme.colorScheme.copyWith(
    primary: Colors.purple,
    secondary: Colors.amber,
    tertiary: Colors.white,
  ),
  textTheme: theme.textTheme.copyWith(
    headline6: const TextStyle(
      fontFamily: 'OpenSans',
      fontSize: 18,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    ),
    headline5: const TextStyle(
      fontFamily: 'OpenSans',
      fontSize: 17,
      color: Colors.white,
    ),
    button: const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
  ),
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(
      fontFamily: 'OpenSans',
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
);
