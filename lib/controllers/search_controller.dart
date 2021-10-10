import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:news_app/models/news_response.dart';
import 'package:news_app/repositories/news_repo.dart';
import 'package:news_app/repositories/news_repo_impl.dart';

class SearchController extends GetxController {
  late NewsRepo _newsRepo;
  RxList<Article> articles = RxList();
  final isLoading = false.obs;
  final searchTextController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    _newsRepo = Get.find<NewsRepoImpl>();
    searchTextController.addListener(() {
      if(searchTextController.text.isNotEmpty) {
        searchNews();
      }
    });
  }

  searchNews() async {
    isLoading.toggle();
    final result = await _newsRepo.getSearchedNews(searchTextController.text);
    articles = result.obs;
    isLoading.toggle();
  }
}