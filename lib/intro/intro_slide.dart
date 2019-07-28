import 'package:dear_diary/data/slide_data.dart';
import 'package:flutter/material.dart';

class IntroSlide extends StatefulWidget {
  @override
  _IntroSlideState createState() => _IntroSlideState();
}

class _IntroSlideState extends State<IntroSlide> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    debugPrint('${MediaQuery.of(context).orientation}');
    final double screenHeight = MediaQuery.of(context).size.height;
    final double containerHeight =
        screenHeight < 500 ? 460 : screenHeight * 0.7;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          height: containerHeight,
          child: PageView.builder(
              itemCount: slide_data.length,
              onPageChanged: (int position) {
                setState(() {
                  _currentIndex = position;
                });
              },
              itemBuilder: (BuildContext context, int position) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      width: 270,
                      height: 200,
                      margin: EdgeInsets.only(top: 50.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xFF3C4858).withOpacity(.4),
                              offset: Offset(6.0, 10.0),
                              blurRadius: 20.0),
                        ],
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
        ),
        Container(
          width: 60,
          margin: EdgeInsets.only(bottom: 40),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              slide_data.length,
              (index) => Indicator(
                active: _currentIndex == index,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Indicator extends StatelessWidget {
  Indicator({this.active = false});

  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6,
      width: 6,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: active
            ? [
                BoxShadow(
                    color: Colors.black.withOpacity(.6),
                    offset: Offset(1, 1),
                    blurRadius: 3)
              ]
            : null,
        color: active ? Color(0xFF3C4858) : Color(0xFFC4C4C4),
      ),
    );
  }
}
