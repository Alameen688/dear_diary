import 'package:dear_diary/utils/auth_helper.dart';
import 'package:flutter/material.dart';

import 'entries/list_entries.dart';
import 'intro/intro.dart';

class Root extends StatefulWidget {
  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  var _authStatus;

  @override
  void initState() {
    super.initState();
    getAuthStatus();
  }

  void getAuthStatus() async {
    final authStatus = await AuthHelper.isAuth();
    setState(() {
      _authStatus = authStatus;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(_authStatus == AuthStatus.LOGGED_IN){
      return ListEntries();
    }
    return Intro();
  }
}
