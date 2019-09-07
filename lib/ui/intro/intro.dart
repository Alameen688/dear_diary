import 'package:flutter/material.dart';

import 'intro_slide.dart';

class Intro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                IntroSlide(),
                Container(
                  width: 300,
                  height: 47,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xFF3C4858).withOpacity(.4),
                          offset: Offset(10.0, 10.0),
                          blurRadius: 10.0),
                    ],
                  ),
                  child: RaisedButton(
                    color: Color(0xFF3C4858),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    onPressed: () {
                      Navigator.of(context).pushNamed('signup');
                    },
                    child: Text(
                      'Create Account',
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                  ),
                ),
                Container(
                  width: 300,
                  height: 47,
                  margin: EdgeInsets.only(top: 20.0),
                  child: FlatButton(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Color(0xFFC4C4C4), width: 1.2),
                        borderRadius: BorderRadius.circular(30.0)),
                    onPressed: () {
                      Navigator.of(context).pushNamed('login');
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}