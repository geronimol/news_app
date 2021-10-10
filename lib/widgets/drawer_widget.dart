import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          SizedBox(height: 100, child: Image.asset('assets/logo.png',)),
          ListTile(
            title: Text('News Headline'),
            leading: Icon(Icons.wysiwyg, color: Colors.indigo,),
            onTap: (){
              Get.offNamed('/news');
            },
          ),
          ListTile(
            title: Text('Search News'),
            leading: Icon(Icons.search, color: Colors.indigo,),
            onTap: (){
              Get.offNamed('/search');
            },
          ),
        ],
      ),
    );
  }
}