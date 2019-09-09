import 'package:flutter/widgets.dart';

class SlideUpRoute extends PageRouteBuilder {
  Widget widget;

  SlideUpRoute({this.widget})
      : super(
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return widget;
            },
            transitionDuration: Duration(milliseconds: 260),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              Animation<Offset> slideUpAnim = Tween<Offset>(
                begin: const Offset(0.0, 1.0),
                end: Offset.zero,
              ).chain(CurveTween(curve: Curves.easeInOutSine)).animate(animation);
              return SlideTransition(position: slideUpAnim, child: child);
            });
}
