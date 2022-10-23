
import 'package:flutter/material.dart';

import 'package:news/models/models.dart';
import 'package:news/theme/theme.dart';

class NewsList extends StatelessWidget {

  final List<Article> news;

  const NewsList({
    Key? key,
    required this.news
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return ListView.builder(
      itemCount: news.length,
      itemBuilder: (context, index) => _Article(article: news[index], index: index)
    );
  }

}

class _Article extends StatelessWidget {

  final Article article;
  final int index;

  const _Article({
    Key? key,
    required this.article,
    required this.index
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

        _TopBarCard(article: article, index: index),

        _TitleCard(article: article),

        _ImageCard(article: article),

        _BodyCard(article: article),

        const _ButtonsCard(),

        const SizedBox( height: 10 ),

        const Divider(),

      ],
    );
  }
}

class _TopBarCard extends StatelessWidget {

  final Article article;
  final int index;

  const _TopBarCard({
    Key? key,
    required this.article, required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric( horizontal: 10 ),
      margin: const EdgeInsets.only( bottom: 10 ),
      child: Row(
        children: [
          Text('${ index + 1 }. ', style: TextStyle( color: myTheme.primaryColor )),
          Text('${ article.source.name }. ', style: TextStyle( color: myTheme.primaryColor )),
        ],
      ),

    );
  }
}

class _TitleCard extends StatelessWidget {
  final Article article;

  const _TitleCard({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric( horizontal: 15 ),
      child: Text(article.title, style: const TextStyle( fontSize: 20, fontWeight: FontWeight.w700 )),
    );
  }
}

class _ImageCard extends StatelessWidget {
  final Article article;

  const _ImageCard({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric( vertical: 10 ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only( topLeft: Radius.circular(50), bottomRight: Radius.circular(50) ),
        child: Container(
          child: article.urlToImage != null
          ? FadeInImage( placeholder: const AssetImage('assets/img/giphy.gif'), image: NetworkImage( article.urlToImage! ) )
          : const Image( image: AssetImage('assets/img/no-image.png'))
        ),
      ),
    );
  }
}

class _BodyCard extends StatelessWidget {
  final Article article;

  const _BodyCard({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric( horizontal: 20 ),
      child: Text(article.description ?? ''),
    );
  }
}

class _ButtonsCard extends StatelessWidget {

  const _ButtonsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          RawMaterialButton(
            onPressed: () {},
            fillColor: myTheme.primaryColor,
            shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20) ),
            child: const Icon( Icons.star_border ),
          ),

          const SizedBox( width: 10 ),

          RawMaterialButton(
            onPressed: () {},
            fillColor: myTheme.hintColor,
            shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20) ),
            child: const Icon( Icons.more_horiz ),
          ),

        ],

      ),
    );
  }
}