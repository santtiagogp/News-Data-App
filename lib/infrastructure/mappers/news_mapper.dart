import '../../domain/entities/news_model.dart';
import '../../ui/interfaces/mapper.dart';

class NewsMapper implements Mapper {
  @override
  fromMap(Map<String, dynamic> json) => News(
    title: json['title'],
    link: json['link'], 
    description: json['description'],
    content: json['content'],
    pubDate: json['pubDate'],
    sourceId: json['sourceId'],
    country: json['country'],
    language: json['language'],
    creator: json['creator'],
    imageUrl: json['imageUrl'],
    keywords: json['keywords'],
    videoUrl: json['videoUrl']
  );

  @override
  Map<String, dynamic> toMap(data) {
    // TODO: implement toMap
    throw UnimplementedError();
  }

}