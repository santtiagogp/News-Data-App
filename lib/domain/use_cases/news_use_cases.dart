import '../entities/latest_news_model.dart';
import '../entities/news_model.dart';
import '../repositories/news_repository.dart';

class NewsUseCases {

  NewsUseCases( this._newsRepository );

  final NewsRepository _newsRepository;

  Future<LastestNews> getLatestNews() => _newsRepository.getLastestNews();

  Future<List<News>> searchNews( String query )
    => _newsRepository.searchNews(query);

  void saveNews( News news ) => _newsRepository.saveNews(news);

  Future<List<News>> getSavedNews() => _newsRepository.getSavedNews();

}