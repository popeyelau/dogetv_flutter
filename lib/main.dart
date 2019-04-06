import 'package:flutter/material.dart';
import 'package:dogetv_flutter/pages/home_page/page.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) => runApp(DogeTVApp()));
}

class DogeTVApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        brightness: Brightness.dark,
      ),
      home: HomePage().buildPage(null),
    );
  }
}
