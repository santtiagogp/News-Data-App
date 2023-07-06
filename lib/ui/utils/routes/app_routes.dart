import 'package:flutter/material.dart';

import '../../screens/home/home_screen.dart';
import '../../screens/news/news_page.dart';
import 'home_routes.dart';
import 'news_routes.dart';

final Map<String, WidgetBuilder> appRoutes = {
  HomeScreen.screenName : HomeRoutes.getInitialPage,
  NewsPage.screenName : NewsRoutes.getInitialPage
};