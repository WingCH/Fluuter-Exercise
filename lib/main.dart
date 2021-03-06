import 'package:demo/pages/main.dart';
import 'package:demo/pages/rxdart.dart';
import 'package:demo/pages/stream.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MainPage(),
        '/rxdart': (context) => RxDartDemo(),
        '/stream': (context) => StreamDemo(),
      },
    );
  }
}
