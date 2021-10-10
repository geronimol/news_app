import 'package:get/get.dart';
import 'package:news_app/models/news_response.dart';
import 'package:news_app/repositories/news_repo.dart';
import 'package:news_app/services/http_service.dart';
import 'package:news_app/services/http_service_impl.dart';

class NewsRepoImpl implements NewsRepo {

  late HttpService _httpService;

  NewsRepoImpl() {
    _httpService = Get.put(HttpServiceImpl());
  }

  @override
  Future<List<Article>> getNewsHeadline() async {
    try {
      final response = await _httpService.getRequest('/v2/top-headlines?country=us');
      final parsedResponse = newsResponseFromJson(Map<String,dynamic>.from(response.data));
      return parsedResponse.articles;
    } on Exception {
      Get.snackbar('Error', 'Could not get articles');
      return RxList();
    }
  }

  @override
  Future<List<Article>> getSearchedNews(String query) async {
    try {
      final response = await _httpService.getRequest('/v2/everything?q=$query');
      final parsedResponse = newsResponseFromJson(response.data);
      return parsedResponse.articles;
    } on Exception {
      Get.snackbar('Error', 'Could not search articles');
      return RxList();
    }
  }


}