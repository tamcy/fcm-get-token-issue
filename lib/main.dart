import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/app.dart';
import 'package:myapp/page/init.dart';

import 'config/application.dart';

const methodChannelName = 'www.myapp.com/methods';

main() async {

  print('[main] Initializing Firebase messaging');
  Application.firebaseMessaging.configure(onMessage: (Map<String, dynamic> message) async {
    print('OnMessage');
  }, onLaunch: (Map<String, dynamic> message) {
    print('onLaunch()');
  }, onResume: (Map<String, dynamic> message) {
    print('onResume()');
  });

  print('[main] Asking for Firebase messaging permissions');
  Application.firebaseMessaging.requestNotificationPermissions();

  await Future.delayed(Duration(seconds: 4));

  // ↑ ↑ ↑ ↑ ↑ ↑ ↑ ↑ ↑ ↑ ↑ ↑ ↑ ↑ ↑ ↑ ↑ ↑ ↑ ↑ ↑ ↑ ↑ ↑ ↑ ↑ ↑ ↑ ↑ 
  // 1. If you copy the above code to to _init() method of 
  //    the InitScreenState class, it works!
  // 2. Method channel invocation SOMETIMES works if you change
  //    the duration to 0.
  // ---------------------------------------------------------
  // 3. OR, the method channel call works again if we explicitly
  //    ask the Java code to rebroadcast the fcm token after the 
  //    await:
  // ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓
  
  //  final platformChannel = const MethodChannel(methodChannelName);
  //  if (Platform.isAndroid) {
  //     platformChannel.invokeMethod('getFCMToken');
  //  }

  print('[main] Showing init screen');
  runApp(MyApp(homepage: InitScreen()));
}
