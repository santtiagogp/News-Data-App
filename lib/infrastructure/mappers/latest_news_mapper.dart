import '../../domain/entities/latest_news_model.dart';
import '../../domain/entities/news_model.dart';
import '../../ui/interfaces/mapper.dart';
import 'news_mapper.dart';

class NewsApiRespMapper implements Mapper {
  @override
  LastestNews fromMap(Map<String, dynamic> json) => LastestNews(
    status: json['status'],
    totalResults: json['totalResults'],
    results: List<News>.from(json["results"].map((x) => NewsMapper().fromMap(x))),
    nextPage: json['nextPage']
  );

  @override
  Map<String, dynamic> toMap(data) => throw UnimplementedError();

}