import 'package:flutter/material.dart';

class DiaryAlert extends StatelessWidget {
  final String message;
  final Function onPressed;

  DiaryAlert({@required this.message, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          height: 180,
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
              Container(
                width: 250,
                height: 45,
                child: RaisedButton(
                    color: Color(0xFF3C4858),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    onPressed: onPressed,
                    child: Text(
                      "Okay",
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
