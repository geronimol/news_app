import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controllers/news_controller.dart';
import 'package:news_app/widgets/articles_listview.dart';
import 'package:news_app/widgets/drawer_widget.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NewsController>();
    return Scaffold(
      appBar: AppBar(
        title: Text('News Headlines'),
      ),
      drawer: DrawerWidget(),
      body: SafeArea(
        child: Obx(() {
          return controller.isLoading.isTrue
              ? Center(child: CircularProgressIndicator())
              : RefreshIndicator(onRefresh: () => controller.loadNews(),child: ArticlesListview(articlesList: controller.articles));
        }),
      ),
    );
  }
}


