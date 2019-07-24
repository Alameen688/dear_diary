import 'package:flutter/material.dart';

import 'intro/intro.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dear Diary',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: TextTheme(
              title: TextStyle(color: Color(0xFF414A53)),
              subhead: TextStyle(color: Color(0xFF686B6F)))),
      initialRoute: '/',
      routes: {'/': (context) => Intro()},
    );
  }
}
