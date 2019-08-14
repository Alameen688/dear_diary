import 'dart:math';

import 'package:flutter/material.dart';

class ViewEntry extends StatefulWidget {
  @override
  _ViewEntryState createState() => _ViewEntryState();
}

class _ViewEntryState extends State<ViewEntry> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        ListView(
          padding: EdgeInsets.only(top: 0.0),
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 340.0,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    'images/entry_1.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 300.0,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(100.0),
                            topLeft: Radius.circular(100.0)),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF3C4858).withOpacity(.4),
                            offset: Offset(0.0, -8),
                            blurRadius: 6,
                          )
                        ]),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 50.0),
              child: Column(
                children: <Widget>[
                  Text(
                    'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don'
                    't look even slightly believable. If you are going to use a'
                    'passage of Lorem Ipsum, you need to be sure there isn'
                    't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.',
                    style: TextStyle(fontSize: 16.0, height: 1.2, color: Color(0xFF3C4858).withOpacity(0.8)),
                  ),
                  Text(
                    'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don'
                    't look even slightly believable. If you are going to use a'
                    'passage of Lorem Ipsum, you need to be sure there isn'
                    't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.',
                    style: TextStyle(fontSize: 16.0, height: 1.2, color: Color(0xFF3C4858).withOpacity(0.8)),
                  )
                ],
              ),
            )
          ],
        ),
        Align(
          alignment: Alignment.topCenter,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkResponse(
                    onTap: () {
                      if (Navigator.of(context).canPop()) {
                        Navigator.of(context).pop();
                      }
                    },
                    child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xFF3C4858).withOpacity(.5),
                                offset: Offset(1.0, 10.0),
                                blurRadius: 10.0),
                          ],
                        ),
                        child: Icon(Icons.arrow_downward)),
                  ),
                  InkResponse(
                    child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xFF3C4858).withOpacity(.5),
                                offset: Offset(1.0, 10.0),
                                blurRadius: 10.0),
                          ],
                        ),
                        child: Icon(Icons.edit)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}

class InvertedBorderClipper extends CustomClipper<Path> {
  num degToRad(num deg) => deg * (pi / 180.0);

  @override
  Path getClip(Size size) {
    debugPrint('$size');
    Path path = Path()..fillType = PathFillType.evenOdd;
//    path.moveTo(0, size.height/2);
//    path.addRect(Rect.fromLTWH(0, 0, size.width, size.height - 30));
    path.addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(0.0, size.height - 20.0, size.width, size.height),
        Radius.circular(16)));

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget _headerInfo;

  _SliverAppBarDelegate(this._headerInfo);

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }

  @override
  double get maxExtent => 200;

  @override
  double get minExtent => 50;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: _headerInfo,
    );
  }
}
