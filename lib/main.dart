import 'package:flutter/material.dart';

import 'NextPage.dart';
import 'Page1.dart';
import 'Page2.dart';
import 'Page3.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class TabInfo {
  String label;
  Widget widget;

  /*コンストラクタ*/
  TabInfo(this.label, this.widget);
}

class HomePage extends StatelessWidget {
  final List<TabInfo> _tabs = [
    TabInfo('フォロー', Page1()),
    TabInfo('おすすめ', Page2()),
    TabInfo('新着', Page3()),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: _tabs.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Tab Controller'),
            bottom: PreferredSize(
              child: TabBar(
                isScrollable: true,
                tabs: _tabs.map((TabInfo tab) {
                  return Tab(text: tab.label);
                }).toList(),
              ),
              preferredSize: Size.fromHeight(50),
            ),
          ),
          body: TabBarView(
            children: _tabs.map((tab) => tab.widget).toList(),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NextPage()),
              );
            },
          ),
        ),
      ),
    );
  }
}
