import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  final Widget homepage;

  MyApp({
    Key key,
    @required this.homepage,
  })  : assert(homepage != null),
        super(key: key);

  @override
  AppState createState() => new AppState();
}

class AppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'App',
      theme: new ThemeData(
        primaryColor: Colors.blue
      ),
      home: widget.homepage,
    );
  }
}
