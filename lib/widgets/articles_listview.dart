import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transparent_image/transparent_image.dart';

class ArticlesListview extends StatelessWidget {
  final RxList articlesList;
  const ArticlesListview({Key? key, required this.articlesList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: ListView.separated(
        itemCount: articlesList.length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, index) {
          return Column(
            children: [
              articlesList[index].urlToImage == null
                  ? Container()
                  : NewsImage(url: articlesList[index].urlToImage.toString()),
              SizedBox(height: 8,),
              Text(articlesList[index].title.toString(), style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),),
              SizedBox(height: 4,),
              Text(articlesList[index].description.toString(),),
            ],
          );
        },
      ),
    );
  }
}

class NewsImage extends StatelessWidget {
  final String url;

  const NewsImage({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: 200,
            child: Image.asset('assets/logo.png', width: 100,),
          ),
          FadeInImage.memoryNetwork(
            image: url,
            placeholder: kTransparentImage,
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}

