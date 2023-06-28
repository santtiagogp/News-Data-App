import 'package:flutter/material.dart';

import '../../screens/home/home_screen.dart';
import 'home_routes.dart';

final Map<String, WidgetBuilder> appRoutes = {
  HomeScreen.screenName : HomeRoutes.getInitialPage
};