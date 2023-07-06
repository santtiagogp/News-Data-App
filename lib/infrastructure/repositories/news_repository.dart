import '../../domain/entities/latest_news_model.dart';
import '../../domain/entities/news_model.dart';
import '../../domain/repositories/news_repository.dart';
import '../mappers/latest_news_mapper.dart';
import '../resp_api/api_manager.dart';

class NewsApiRepository extends NewsRepository{

  final _apiManager = ApiManager();

  @override
  Future<LastestNews> getLastestNews() async {

    const String endpoint = '/news?language=EN';

    final Map<String, dynamic> resp = await _apiManager.get(endpoint);

    final data = NewsApiRespMapper().fromMap(resp);

    return data;

  }

  @override
  Future<List<News>> searchNews( String query ) async {
    
    final String endpoint = '/news?language=EN&q=$query';

    final Map<String, dynamic> resp = await _apiManager.get(endpoint);

    final data = NewsApiRespMapper().fromMap(resp);

    return data.results;
    
  }

}