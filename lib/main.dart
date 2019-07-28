import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'auth/login.dart';
import 'entries/list_entries.dart';
import 'intro/intro.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  return runApp(DearDiary());
}

class DearDiary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dear Diary',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          inputDecorationTheme: InputDecorationTheme(
            hintStyle: TextStyle(color: Color(0xFFC4C4C4), fontSize: 20.0),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF3C4858), width: 2.0),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black45, width: 2.0),
            ),
          ),
          textTheme: TextTheme(
            title: TextStyle(color: Color(0xFF414A53)),
            subhead: TextStyle(color: Color(0xFF686B6F)),
          )),
      initialRoute: '/',
      routes: {
        '/': (context) => Intro(),
        '/login': (context) => Login(),
        '/list-entries': (context) => ListEntries(),
      },
    );
  }
}
