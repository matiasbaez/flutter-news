
import 'package:flutter/material.dart';
import 'package:news/screens/screens.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {

  static String routerName = 'Tabs';

  const TabsPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return ChangeNotifierProvider(
      create: (_) => _NavigationModel(),
      child: const Scaffold(
        body: _Pages(),
        bottomNavigationBar: _Navigation(),
      ),
    );
  }

}

class _Navigation extends StatelessWidget {
  const _Navigation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final navigationModel = Provider.of<_NavigationModel>(context);

    return BottomNavigationBar(
      currentIndex: navigationModel.currentPage,
      onTap: (index) => navigationModel.currentPage = index,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'For you'
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.public),
          label: 'Headlines'
        )
      ],
    );
  }
}

class _Pages extends StatelessWidget {
  const _Pages({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationModel = Provider.of<_NavigationModel>(context);

    return PageView(
      controller: navigationModel.pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: const <Widget>[

        Tab1Page(),

        Tab2Page()

      ],

    );
  }
}

class _NavigationModel with ChangeNotifier {

  int _currentPage = 0;
  final PageController _pageController = PageController();

  int get currentPage => _currentPage;

  set currentPage(int value) {
    _currentPage = value;
    _pageController.animateToPage(_currentPage, duration: const Duration(microseconds: 250), curve: Curves.easeOut);
    notifyListeners();
  }

  PageController get pageController => _pageController;

}