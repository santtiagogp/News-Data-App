import '../../domain/entities/latest_news_model.dart';
import '../../ui/interfaces/mapper.dart';

class LastestNewsMapper implements Mapper {
  @override
  LastestNews fromMap(Map<String, dynamic> json) => LastestNews(
    status: json['status'],
    totalResults: json['totalResults'],
    results: json['results'],
    nextPage: json['nextPage']
  );

  @override
  Map<String, dynamic> toMap(data) {
    // TODO: implement toMap
    throw UnimplementedError();
  }

}