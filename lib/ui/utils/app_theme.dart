import 'package:flutter/material.dart';

class NewsTheme {

  static final ThemeData appTheme = ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: Colors.orange,
      onPrimary: Colors.white,
      secondary: Colors.orangeAccent,
      onSecondary: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      background: Colors.grey.shade100,
      onBackground: Colors.black,
      surface: Colors.white,
      onSurface: Colors.black
    ),
    useMaterial3: true,
    primaryColor: Colors.orange,
    navigationBarTheme: NavigationBarThemeData(
      indicatorColor: Colors.orange[200]
    )
  );

}