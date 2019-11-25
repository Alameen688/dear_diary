import 'package:flutter/material.dart';

class RawDiaryDialog extends StatelessWidget {
  final String message;
  final List<Widget> actions;
  final double height;

  const RawDiaryDialog(
      {Key key, @required this.message, this.actions, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          height: height ?? 180.0,
          decoration: ShapeDecoration(
              color: Theme.of(context).cardColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          width: MediaQuery.of(context).size.width * .8,
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Spacer(),
              Container(
                child: Text(
                  message,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
                ),
              ),
              Spacer(),
              if (actions != null)
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: actions,
                )
            ],
          ),
        ),
      ),
    );
  }
}
