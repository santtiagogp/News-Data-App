import 'package:flutter/material.dart';
import 'package:news_app/ui/screens/news/news_page.dart';
import 'package:news_app/ui/utils/routes/news_routes.dart';

import '../../screens/home/home_screen.dart';
import 'home_routes.dart';

final Map<String, WidgetBuilder> appRoutes = {
  HomeScreen.screenName : HomeRoutes.getInitialPage,
  NewsPage.screenName : NewsRoutes.getInitialPage
};