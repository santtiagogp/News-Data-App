import '../entities/latest_news_model.dart';

abstract class NewsRepository {

  Future<LastestNews> getLastestNews();

  Future<LastestNews> searchNews( String query );

}