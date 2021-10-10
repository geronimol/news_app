import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controllers/search_controller.dart';
import 'package:news_app/widgets/articles_listview.dart';
import 'package:news_app/widgets/drawer_widget.dart';

class SearchNewsScreen extends StatelessWidget {
  const SearchNewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SearchController>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Search News Headlines'),
      ),
      drawer: DrawerWidget(),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onSubmitted: (String s) {
                  if(s.isNotEmpty) {
                    controller.searchNews(s);
                  } else {
                    Get.snackbar('Empty query', 'Please write something to search news');
                  }
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.indigo,),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.indigo),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.indigoAccent),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Obx((){
                return controller.isLoading.isTrue
                    ? Center(child: CircularProgressIndicator())
                    : controller.articles.isEmpty
                    ? Center(child: Text('No news found'))
                    : ArticlesListview(articlesList: controller.articles);
              }),
            ),
          ],
        ),
      ),
    );
  }
}
