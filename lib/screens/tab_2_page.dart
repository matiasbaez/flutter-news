
import 'package:flutter/material.dart';
import 'package:news/theme/theme.dart';
import 'package:provider/provider.dart';

import 'package:news/services/services.dart';
import 'package:news/widgets/widgets.dart';
import 'package:news/models/models.dart';

class Tab2Page extends StatelessWidget {

  static String routerName = 'Tab2';

  const Tab2Page({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    final articles = newsService.getArticleBySelectedCategory;

    return SafeArea(
      child: Scaffold(
        body: Column(

          children: <Widget>[
            const _CategoryList(),
            
            (articles.isEmpty)
            ? const Center(child: CircularProgressIndicator())
            : Expanded(child: NewsList(news: articles))

          ],

        ),
      ),
    );
  }

}

class _CategoryList extends StatelessWidget {
  const _CategoryList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final categories = Provider.of<NewsService>(context).categories;

    return Container(
      width: double.infinity,
      height: 80,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext _, int index) {

          final category = categories[index];
          final categoryName = category.name;

          return Padding(
            padding: const EdgeInsets.all(8),
            child: Column(

              children: <Widget>[
                _CategoryButton(category: category),
                const SizedBox( height: 5 ),
                Text( '${categoryName[0].toUpperCase()}${categoryName.substring(1)}' )
              ],

            ),
          );
        }
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {

  const _CategoryButton({
    Key? key,
    required this.category,
  }) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context, listen: false);

    return GestureDetector(
      onTap: () => newsService.selectedCategory = category.name,
      child: Container(
        width: 40,
        height: 40,
        margin: const EdgeInsets.symmetric( horizontal: 10 ),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white
        ),
        child: Icon(
          category.icon,
          color: newsService.selectedCategory == category.name
            ? myTheme.colorScheme.primary
            : Colors.black54
        ),
      ),
    );
  }
}