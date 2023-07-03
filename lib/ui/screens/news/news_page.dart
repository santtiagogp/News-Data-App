import 'package:flutter/material.dart';

import '../../../domain/entities/news_model.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  static const String screenName = 'news';

  @override
  Widget build(BuildContext context) {

  final args = ModalRoute.of(context)!.settings.arguments as News;

    return Scaffold(
      body: Center(
        child: Text(args.title),
      ),
    );
  }
}