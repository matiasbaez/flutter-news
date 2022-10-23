
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:news/models/models.dart';

const _baseUrl = 'newsapi.org';
const _APIKey = '426d295d6dc1446182ca9cfb162c639f';

class NewsService extends ChangeNotifier {

  List<Article> headlines = [];

  NewsService() {
    getTopHeadlines();
  }

  getTopHeadlines() async {
    final url = Uri.https(_baseUrl, 'v2/top-headlines', {
      'apiKey': _APIKey,
      'country': 'us'
    });

    final response = await http.get(url);
    final newsResponse = NewsResponse.fromJson(response.body);

    headlines.addAll( newsResponse.articles );

    notifyListeners();
  }

}