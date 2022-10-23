import 'package:flutter/material.dart';
import 'package:news/screens/screens.dart';
import 'package:news/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News',
      theme: myTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: TabsPage.routerName,
      routes: {
        TabsPage.routerName: (context) => const TabsPage(),
      },
    );
  }
}
