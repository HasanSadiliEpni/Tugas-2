import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.black,
  colorScheme: ColorScheme.dark(
    primary: Colors.black,
    secondary: Colors.blueAccent,
  ),
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: AppBarTheme(color: Colors.black),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Colors.white),
  ),
);

final lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.white,
  colorScheme: ColorScheme.light(
    primary: Colors.white,
    secondary: Colors.blueAccent,
  ),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(color: Colors.white),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Colors.blueAccent),
    bodyMedium: TextStyle(color: Colors.white),
  ),
);
