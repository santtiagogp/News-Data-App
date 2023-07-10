import 'package:flutter/material.dart';

import '../../../domain/entities/news_model.dart';

class Helpers {

  Helpers._();

  static void navigateToNews( BuildContext context, News news, String routeName)
    => Navigator.pushNamed(
      context,
      routeName,
      arguments: news
    );

  static String shortTitle( String title ) {

    String txt = title;

    if(txt.length < 10) {
      return txt;
    }

    return '${txt.substring(0, 20)}...';
  }
}