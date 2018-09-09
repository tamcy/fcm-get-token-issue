import 'dart:async';
import 'package:flutter/material.dart';
import 'package:myapp/config/application.dart';

class InitScreen extends StatefulWidget {
  const InitScreen({
    Key key,
  }) : super(key: key);

  @override
  InitScreenState createState() => new InitScreenState();
}

class InitScreenState extends State<InitScreen> {
  String _progressText = '';

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<bool> _init() async {

    print('[InitScreen] Calls firebaseMessaging.getToken()');
    Application.firebaseMessaging.getToken().timeout(const Duration(seconds: 5), onTimeout: () {
      print('[InitScreen] Unable to retrieve FCM token');
      setState(() {
        _progressText = 'Unable to retrieve FCM token';
      });
      return null;
    }).then((value) {
      if (value != null) {
        print('[InitScreen] FCM token retrieved successfully: $value');
        setState(() {
          _progressText = 'FCM Token: ${value}';
        });
      }
      return value;
    });

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        body: new Container(
          decoration: new BoxDecoration(
            color: Colors.teal,
          ),
          child: new Center(
            child: new Directionality(
              textDirection: TextDirection.ltr,
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text(_progressText, style: new TextStyle(color: Colors.white, fontSize: 24.0),),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
