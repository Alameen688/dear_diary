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
                final currentSlide = slide_data[position];
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      width: 270,
                      height: 380,
                      margin: EdgeInsets.only(top: 100.0),
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
                            currentSlide.imageUrl,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Align(
                        alignment: Alignment(0.1, 1.0),
                        child: Container(
                          padding: EdgeInsets.all(15.0),
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.blueGrey.withOpacity(0.8),
                          ),
                          child: Text(
                            currentSlide.title,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
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
