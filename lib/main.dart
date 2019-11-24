import 'package:dear_diary/view_model/entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'services/locator.dart';
import 'ui/auth/login.dart';
import 'ui/auth/sign_up.dart';
import 'ui/entries/add_entry.dart';
import 'ui/entries/edit_entry.dart';
import 'ui/entries/view_entry.dart';
import 'ui/home.dart';
import 'ui/intro/intro.dart';
import 'ui/root.dart';
import 'view_model/user.dart';

List<Future> systemChromeTasks = [
  SystemChrome.setEnabledSystemUIOverlays([]),
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]),
  setupLocator(),
];
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait(systemChromeTasks);

  return runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          builder: (context) => UserViewModel(),
        ),
        ChangeNotifierProvider(
          builder: (context) => EntryViewModel(),
        ),
      ],
      child: DearDiary(),
    ),
  );
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
          primaryColor: Color(0xFF3C4858),
          primaryIconTheme: IconThemeData(color: Color(0xFF3C4858)),
          textTheme: TextTheme(
            title: TextStyle(color: Color(0xFF414A53)),
            subhead: TextStyle(color: Color(0xFF686B6F)),
          )),
      initialRoute: '/',
      routes: {
        '/': (context) => Root(),
        Intro.routeName: (context) => Intro(),
        Login.routeName: (context) => Login(),
        SignUp.routeName: (context) => SignUp(),
        Home.routeName: (context) => Home(),
        ViewEntry.routeName: (context) => ViewEntry(),
        AddEntry.routeName: (context) => AddEntry(),
        EditEntry.routeName: (context) => EditEntry(),
      },
    );
  }
}
