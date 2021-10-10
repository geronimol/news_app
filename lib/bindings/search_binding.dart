import 'package:get/get.dart';
import 'package:news_app/controllers/search_controller.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SearchController());
  }

}