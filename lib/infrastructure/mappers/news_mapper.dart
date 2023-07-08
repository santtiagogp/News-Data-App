import '../../domain/entities/news_model.dart';
import '../../ui/interfaces/mapper.dart';

class NewsMapper implements Mapper {
  @override
  fromMap(Map<String, dynamic> json) => News(
    title: json['title'],
    link: json['link'], 
    description: json['description'] ?? 'No description',
    content: json['content'] ?? 'Empty news',
    pubDate: DateTime.parse(json['pubDate']),
    sourceId: json['sourceId'] ?? '',
    country: List<String>.from(json["country"].map((x) => x)),
    language: json['language'],
    creator: List<String>.from(json["creator"] ?? []).map((e) => e).toList(),
    imageUrl: json['image_url'] ?? 'https://static.thenounproject.com/png/3674270-200.png',
    keywords: List.from(json["keywords"] ?? []).map((e) => e = '').toList(),
    videoUrl: json['videoUrl']
  );

  @override
  Map<String, dynamic> toMap(data) => throw UnimplementedError();

}