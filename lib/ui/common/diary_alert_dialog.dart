import 'package:dear_diary/ui/common/raw_diary_dialog.dart';
import 'package:flutter/material.dart';

class DiaryAlertDialog extends StatelessWidget {
  final String message;
  final Function onPressed;
  final String actionText;

  DiaryAlertDialog(
      {@required this.message, @required this.onPressed, this.actionText});

  @override
  Widget build(BuildContext context) {
    return RawDiaryDialog(
      message: message,
      actions: [
        Container(
          width: 250,
          height: 45,
          child: RaisedButton(
            color: Color(0xFF3C4858),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            onPressed: onPressed,
            child: Text(
              actionText ?? "Okay",
              style: TextStyle(color: Colors.white, fontSize: 16.0),
            ),
          ),
        )
      ],
    );
  }
}
