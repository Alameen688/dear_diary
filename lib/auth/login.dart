import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TapGestureRecognizer _signUpTapRecognizer;

  @override
  void initState() {
    super.initState();
    _signUpTapRecognizer = TapGestureRecognizer()..onTap = _handleSignInTap;
  }

  _handleSignInTap() {
    Navigator.of(context).pushNamed('/signup');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        elevation: 0.0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: InkWell(
          customBorder: CircleBorder(),
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back,
            color: Color.fromRGBO(90, 97, 117, 1),
            size: 30,
          ),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Positioned(
                right: 20,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'Dear',
                      style: TextStyle(
                          color: Color(0xFFEAEEF6).withOpacity(.5),
                          fontSize: 100.0),
                    ),
                    Text(
                      'Diary',
                      style: TextStyle(
                          color: Color(0xFFEAEEF6).withOpacity(.5),
                          fontSize: 100.0),
                    ),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25.0,
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Hey! ",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 40.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Is that you?",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text('Email'),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20.0),
                    child: TextFormField(
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                          hintText: 'It\'s-me@mail.com',
                          suffixIcon: Icon(Icons.alternate_email)),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text('Password'),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20.0),
                    child: TextFormField(
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                          hintText: 'Our litte secret',
                          suffixIcon: Icon(Icons.lock_outline)),
                      obscureText: true,
                    ),
                  ),
                  Container(
                    width: 320,
                    height: 60,
                    margin: EdgeInsets.only(top: 40, bottom: 30.0),
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
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            '/list-entries', (Route<dynamic> route) => false);
                      },
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(left: 40.0),
                              child: Text(
                                'Let\'s go',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18.0),
                              ),
                            ),
                          ),
                          Container(
                            height: 40.0,
                            width: 40.0,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            child: Icon(
                              Icons.arrow_forward,
                              color: Color(0xFF3C4858),
                              size: 20.0,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: RichText(
                        text: TextSpan(
                            style: Theme.of(context).textTheme.body1,
                            children: [
                          TextSpan(
                            text: 'First time here? ',
                          ),
                          TextSpan(
                              text: 'Sign Up',
                              style: TextStyle(color: Color(0xFF3C4858)),
                              recognizer: _signUpTapRecognizer),
                        ])),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }

  @override
  void dispose() {
    _signUpTapRecognizer.dispose();
    super.dispose();
  }
}
