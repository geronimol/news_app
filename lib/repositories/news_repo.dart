import 'package:news_app/models/news_response.dart';

abstract class NewsRepo {
  Future<List<Article>> getNewsHeadline();
  Future<List<Article>> getSearchedNews(String query);
}