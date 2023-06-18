import 'package:flutter/material.dart';

import 'ui/utils/app_routes.dart';
import 'ui/utils/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      theme: NewsTheme.appTheme,
      routes: appRoutes,
    );
  }
}
