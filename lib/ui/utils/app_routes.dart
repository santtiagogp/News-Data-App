import 'package:flutter/material.dart';
import '../screens/home/home_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  HomeScreen.screenName : ( context ) => const HomeScreen()
};