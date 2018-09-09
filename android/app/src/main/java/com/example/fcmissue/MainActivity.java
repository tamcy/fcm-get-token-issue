package com.example.fcmissue;

import android.os.Bundle;
import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;

import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugins.firebasemessaging.FlutterFirebaseInstanceIDService;

public class MainActivity extends FlutterActivity {
  private static final String PAYMENT_METHOD_CHANNEL = "www.myapp.com/methods";

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);
    initFlutterChannels();
  }

  private void initFlutterChannels() {
    // Creates an event channel which is responsible for notifying the payment nonce to Flutter.
    new MethodChannel(getFlutterView(), PAYMENT_METHOD_CHANNEL).setMethodCallHandler(
            new MethodCallHandler() {
              @Override
              public void onMethodCall(MethodCall call, Result result) {
                if (call.method.equals("getFCMToken")) {
                  FlutterFirebaseInstanceIDService.broadcastToken(MainActivity.this);
                  result.success(null);
                } else {
                  result.notImplemented();
                }
              }
            }
    );
  }
}
