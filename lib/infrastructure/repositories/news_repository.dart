import '../../domain/entities/latest_news_model.dart';
import '../../domain/repositories/news_repository.dart';
import '../mappers/latest_news_mapper.dart';
import '../resp_api/api_manager.dart';

class NewsApiRepository extends NewsRepository{

  final _apiManager = ApiManager();

  @override
  Future<LastestNews> getLastestNews() async {

    const String endpoint = '/news?language=EN';

    final Map<String, dynamic> resp = await _apiManager.get(endpoint);

    final data = LastestNewsMapper().fromMap(resp);

    return data;

  }

  @override
  Future<LastestNews> searchNews(String query) {
    // TODO: implement searchNews
    throw UnimplementedError();
  }

}