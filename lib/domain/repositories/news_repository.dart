import '../entities/latest_news_model.dart';
import '../entities/news_model.dart';

abstract class NewsRepository {

  Future<LastestNews> getLastestNews();

  Future<List<News>> searchNews( String query );

}