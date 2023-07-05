import 'package:flutter/material.dart';

import '../../../domain/entities/news_model.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  static const String screenName = 'news';

  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)!.settings.arguments as News;

    final primaryColor = Theme.of(context).primaryColor;

    return Scaffold(

      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(args.title),
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  args.title,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500
                  )
                ),
                const SizedBox( height: 20 ),
                SizedBox(
                  width: 200,
                  height: 200,
                  child: Image(
                    image: NetworkImage(args.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox( height: 20 ),
                Text(args.content, style: const TextStyle(fontSize: 20)),
              ],
            )
          )
        ],
      )

    );
  }
}