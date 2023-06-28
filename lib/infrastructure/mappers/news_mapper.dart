import '../../domain/entities/news_model.dart';
import '../../ui/interfaces/mapper.dart';

class NewsMapper implements Mapper {
  @override
  fromMap(Map<String, dynamic> json) => News(
    title: json['title'],
    link: json['link'], 
    description: json['description'],
    content: json['content'],
    pubDate: DateTime.parse(json['pubDate']),
    sourceId: json['sourceId'] ?? '',
    country: List<String>.from(json["country"].map((x) => x)),
    language: json['language'],
    creator: List<String>.from(json["creator"] ?? []).map((String e) => e).toList(),
    imageUrl: json['imageUrl'] ?? 'https://static.thenounproject.com/png/3674270-200.png',
    keywords: List<String>.from(json["keywords"] ?? []).map((String e) => e).toList(),
    videoUrl: json['videoUrl']
  );

  @override
  Map<String, dynamic> toMap(data) => throw UnimplementedError();

}