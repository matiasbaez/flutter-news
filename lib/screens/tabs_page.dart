
import 'package:flutter/material.dart';

class TabsPage extends StatelessWidget {

  static String routerName = 'Tabs';

  const TabsPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return const Scaffold(
      body: _Pages(),
    );
  }

}

class _Pages extends StatelessWidget {
  const _Pages({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(

      physics: const BouncingScrollPhysics(),
      children: <Widget>[

        Container(color: Colors.red),
        Container(color: Colors.green),

      ],

    );
  }
}