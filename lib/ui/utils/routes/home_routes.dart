import 'package:flutter/material.dart';
import '../../../domain/use_cases/news_use_cases.dart';
import '../../../infrastructure/repositories/news_repository.dart';

import '../../screens/home/home_screen.dart';

class HomeRoutes {

  HomeRoutes._();

  static HomeScreen getInitialPage( BuildContext context ) => HomeScreen(
    useCases: NewsUseCases( NewsApiRepository() )
  );

}