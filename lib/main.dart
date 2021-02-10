import 'package:flutter/material.dart';
import 'package:flutter_element/bloc_sample/main_search.dart';
import 'package:flutter_element/bloc_sample/search_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Demo"),
        ),
        body: MainSearch(),
      ),
    );
  }
}
