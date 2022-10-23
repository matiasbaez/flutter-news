
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

import 'package:news/models/models.dart';

const _baseUrl = 'newsapi.org';
const _APIKey = '426d295d6dc1446182ca9cfb162c639f';
const _version = 'v2';

class NewsService extends ChangeNotifier {

  String _selectedCategory = 'business';

  List<Article> headlines = [];
  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.volleyball, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology'),
  ];

  Map<String, List<Article>> articlesByCategory = {};

  NewsService() {
    getTopHeadlines();

    categories.forEach((category) {
      articlesByCategory[category.name] = [];
    });

    getArticlesByCategory( _selectedCategory );
  }

  String get selectedCategory => _selectedCategory;
  get getArticleBySelectedCategory => articlesByCategory[_selectedCategory];

  set selectedCategory(String value) {
    _selectedCategory = value;
    getArticlesByCategory(value);
    notifyListeners();
  }

  getTopHeadlines() async {
    final url = Uri.https(_baseUrl, '$_version/top-headlines', {
      'apiKey': _APIKey,
      'country': 'us'
    });

    final response = await http.get(url);
    final newsResponse = NewsResponse.fromJson(response.body);

    headlines.addAll( newsResponse.articles );

    notifyListeners();
  }

  getArticlesByCategory(String category) async {

    if (articlesByCategory[category]!.isNotEmpty) return articlesByCategory[category];

    final url = Uri.https(_baseUrl, '$_version/top-headlines', {
      'apiKey'  : _APIKey,
      'country' : 'us',
      'category': category
    });

    final response = await http.get(url);
    final newsResponse = NewsResponse.fromJson(response.body);

    articlesByCategory[category]!.addAll( newsResponse.articles );

    notifyListeners();
  }

}