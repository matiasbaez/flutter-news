
import 'package:flutter/material.dart';
import 'package:news/widgets/news_list.dart';
import 'package:provider/provider.dart';

import 'package:news/services/services.dart';

class Tab1Page extends StatelessWidget {

  static String routerName = 'Tab1';

  const Tab1Page({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final newsService = Provider.of<NewsService>(context);
    final headlines = newsService.headlines;

    return Scaffold(
      body: NewsList(news: headlines),
    );
  }

}