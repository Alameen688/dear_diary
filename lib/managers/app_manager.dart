import 'package:dear_diary/models/dialog_action.dart';
import 'package:dear_diary/models/dialog_info.dart';
import 'package:dear_diary/services/dialog_service.dart';
import 'package:dear_diary/services/locator.dart';
import 'package:dear_diary/ui/common/diary_alert.dart';
import 'package:flutter/material.dart';

class AppManager extends StatefulWidget {
  final Widget child;

  const AppManager({Key key, this.child}) : super(key: key);

  @override
  _AppManagerState createState() => _AppManagerState();
}

class _AppManagerState extends State<AppManager> {
  DialogService _dialogService = locator<DialogService>();
  @override
  void initState() {
    super.initState();
    _dialogService.setOnshowListener(_onShow);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  _onShow(DialogInfo dialogInfo) {
    showDialog(
      context: context,
      builder: (_) => DiaryAlert(
        message: dialogInfo.message,
        onPressed: () {
          Navigator.of(context).pop();
          _dialogService.dialogComplete(DialogAction(confirmed: true));
        },
      ),
    );
  }
}
