import 'package:dear_diary/ui/common/raw_diary_dialog.dart';
import 'package:flutter/material.dart';

class DiaryConfirmDialog extends StatelessWidget {
  final String message;
  final Function onCancelled;
  final Function onConfirmed;

  DiaryConfirmDialog({
    @required this.message,
    this.onCancelled,
    @required this.onConfirmed,
  });

  @override
  Widget build(BuildContext context) {
    return RawDiaryDialog(
      height: 200,
      message: message,
      actions: [
        Container(
          width: 250,
          height: 45,
          margin: EdgeInsets.only(top: 10.0),
          child: RaisedButton(
            color: Color(0xFF3C4858),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            onPressed: () {
              Navigator.of(context).pop();
              onConfirmed();
            },
            child: Text(
              'Yes',
              style: TextStyle(color: Colors.white, fontSize: 16.0),
            ),
          ),
        ),
        Container(
          width: 250,
          height: 45,
          margin: EdgeInsets.only(top: 10.0),
          child: RaisedButton(
            color: Color(0xFF3C4858).withOpacity(0.5),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            onPressed: () {
              Navigator.of(context).pop();
              onCancelled?.call();
            },
            child: Text(
              'No',
              style: TextStyle(color: Colors.white, fontSize: 16.0),
            ),
          ),
        )
      ],
    );
  }
}
