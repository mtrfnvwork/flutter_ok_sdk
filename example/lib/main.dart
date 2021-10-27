import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ok_sdk/flutter_ok_sdk.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String token = '';
  String secret = '';

  @override
  void initState() {
    super.initState();
  }

  Future<void> initPlatformState() async {
    try {
      final okAuth = await FlutterOkSdk.login();

      setState(() {
        token = okAuth.token;
        secret = okAuth.secret;
      });
    } on PlatformException catch(e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
          actions: [
            IconButton(
              icon: const Icon(Icons.assignment_ind),
              onPressed: initPlatformState,
            )
          ],
        ),
        body: Center(
          child: Column(
            children: [
            Text('Token: $token'),
            Text('Secret: $secret'),
          ],
          )
        ),
      ),
    );
  }
}
