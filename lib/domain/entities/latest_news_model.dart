import 'news_model.dart';

class LastestNews {
    final String status;
    final int totalResults;
    final List<News> results;
    final String nextPage;

    LastestNews({
        required this.status,
        required this.totalResults,
        required this.results,
        required this.nextPage,
    });

}