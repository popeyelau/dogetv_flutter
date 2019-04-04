import 'package:dogetv_flutter/pages/category_page/page.dart';
import 'package:flutter/material.dart';
import 'package:dogetv_flutter/pages/home_page/page.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(DogeTVApp());
}

class DogeTVApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        brightness: Brightness.dark,
      ),
      home: TabBarPage(title: '五行缺脑'),
    );
  }
}

class TabBarPage extends StatefulWidget {
  TabBarPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<TabBarPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  List<Widget> children;
  List<Widget> tabs;

  @override
  void initState() {
    super.initState();
    children = [
      HomePage().buildPage(null),
      CategoryPage().buildPage(null),
    ];
    tabs = [
      Tab(text: "首页", icon: Icon(Icons.home)),
      Tab(text: "片库", icon: Icon(Icons.subscriptions)),
    ];
    tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        children: children,
        controller: tabController,
      ),
      bottomNavigationBar: Material(
        color: Theme.of(context).primaryColor,
        child: TabBar(
          isScrollable: false,
          tabs: tabs,
          controller: tabController,
        ),
      ),
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}
