import 'dart:convert';

import 'package:news_app/infrastructure/mappers/news_mapper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/latest_news_model.dart';
import '../../domain/entities/news_model.dart';
import '../../domain/repositories/news_repository.dart';
import '../mappers/latest_news_mapper.dart';
import '../resp_api/api_manager.dart';

class NewsApiRepository extends NewsRepository{

  NewsApiRepository() {
    initializeSharedPrefs();
  }

  final _apiManager = ApiManager();
  late SharedPreferences prefs;
  Map<String, List<News>> savedNews = {
    "news" : [

    ]
  };

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
  
  @override
  void saveNews(News news) async {

    if(prefs.getString('saved_news') != null) {
      final stringData = prefs.getString('saved_news');

      Map<String, List<News>> decodedData = jsonDecode(stringData.toString());

      savedNews = decodedData;
    }

    savedNews['news']!.add(news);

    Map<String, dynamic> data = {};

    data['news'] = savedNews['news'];

    print(data);

    //await prefs.setString('saved_news', jsonEncode(savedNews));
    
  }

  void initializeSharedPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

}