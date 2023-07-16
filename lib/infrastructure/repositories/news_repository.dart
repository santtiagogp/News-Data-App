import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import '../mappers/news_mapper.dart';

import '../../domain/entities/latest_news_model.dart';
import '../../domain/entities/news_model.dart';
import '../../domain/repositories/news_repository.dart';
import '../mappers/latest_news_mapper.dart';
import '../resp_api/api_manager.dart';

class NewsApiRepository extends NewsRepository{

  NewsApiRepository();

  final _apiManager = ApiManager();
  static const String key = "saved_news";
  Map<String, List<News>> savedNews = {"news" : []};

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

    final prefs = await SharedPreferences.getInstance();

    if(prefs.getString(key) != null) {
      final stringData = prefs.getString(key);

      Map<String, dynamic> decodedData = jsonDecode(stringData.toString());

      List<News> newsList = List<News>.from(
        decodedData["news"].map((x) => NewsMapper().fromMap(x))
      );

      Map<String, List<News>> mapNewsData = {};

      mapNewsData["news"] = newsList;

      savedNews = mapNewsData;

    }

    savedNews['news']!.add(news);

    List<Map<String, dynamic>> newsList = List.empty( growable: true );

    Map<String, dynamic> newsData = {};

    for (News element in savedNews['news']!) {

      final Map<String, dynamic> jsonNews = NewsMapper().toMap(element);

      newsList.add(jsonNews);

    }

    newsData['news'] = newsList;

    await prefs.setString(key, jsonEncode(newsData));
    
  }

  @override
  Future<List<News>> getSavedNews() async {

    final prefs = await SharedPreferences.getInstance();

    final List<News> savedNewsData = List.empty( growable: true );

    if( prefs.getString(key) == null ) {
      
      Map<String, dynamic> data = {
        "news" : []
      };

      prefs.setString(key, jsonEncode(data));

      return await Future.delayed(
        Duration.zero,
        () => savedNewsData
      );

    } else {

      final codedData = prefs.getString(key);

      final Map<String, dynamic> decodedData = jsonDecode(codedData.toString());

      for (Map<String, dynamic> news in decodedData['news']) {
        
        final mappedData = NewsMapper().fromMap(news);

        savedNewsData.add(mappedData);

      }

      return await Future.delayed(
        Duration.zero,
        () => savedNewsData
      );

    }

  }

}