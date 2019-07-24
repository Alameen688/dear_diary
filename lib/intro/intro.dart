import 'package:dear_diary/data/slide_data.dart';
import 'package:flutter/material.dart';

class Intro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double containerHeight =
        screenHeight < 500 ? 500 : screenHeight * 0.9;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: containerHeight,
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                Expanded(child: IntroSlide()),
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
                    onPressed: () => debugPrint('signup pressed'),
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
                    onPressed: () => debugPrint('login pressed'),
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

class IntroSlide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint('${MediaQuery.of(context).orientation}');
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: PageView.builder(
          itemCount: slide_data.length,
          itemBuilder: (BuildContext context, int position) {
            return Column(
              children: <Widget>[
                Container(
                  width: 270,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [BoxShadow()],
                    image: DecorationImage(
                      image: AssetImage(
                        slide_data[position].imageUrl,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: 300,
                  margin: EdgeInsets.symmetric(vertical: 28.0),
                  alignment: Alignment.center,
                  child: Text(
                    slide_data[position].title,
                    style: Theme.of(context)
                        .textTheme
                        .title
                        .copyWith(fontSize: 22.0),
                  ),
                ),
                Container(
                  width: 300,
                  alignment: Alignment.center,
                  child: Text(
                    slide_data[position].description,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.subhead,
                  ),
                )
              ],
            );
          }),
    );
  }
}
