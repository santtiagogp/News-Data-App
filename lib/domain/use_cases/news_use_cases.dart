import '../entities/latest_news_model.dart';
import '../repositories/news_repository.dart';

class NewsUseCases {

  NewsUseCases( this._newsRepository );

  final NewsRepository _newsRepository;

  Future<LastestNews> getLatestNews() => _newsRepository.getLastestNews();

}