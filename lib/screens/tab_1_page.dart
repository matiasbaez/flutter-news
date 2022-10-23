
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:news/services/services.dart';
import 'package:news/widgets/widgets.dart';

class Tab1Page extends StatefulWidget {

  static String routerName = 'Tab1';

  const Tab1Page({ Key? key }) : super(key: key);

  @override
  State<Tab1Page> createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {

    final newsService = Provider.of<NewsService>(context);
    final headlines = newsService.headlines;

    return Scaffold(
      body: (headlines.isEmpty)
      ? const Center(child: CircularProgressIndicator())
      : NewsList(news: headlines),
    );
  }
  
  @override
  bool get wantKeepAlive => true;
}