import 'package:dear_diary/models/entry.dart';
import 'package:dear_diary/notifiers/entry.dart';
import 'package:dear_diary/ui/common/diary_alert.dart';
import 'package:dear_diary/utils/input_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class EditEntry extends StatefulWidget {
  static const routeName = 'edit-entry';

  EditEntry({Key key}) : super(key: key);

  _EditEntryState createState() => _EditEntryState();
}

class _EditEntryState extends State<EditEntry> {
  Map<String, dynamic> _formData = {};
  final _editEntryFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Entry entry = ModalRoute.of(context).settings.arguments;
    _formData['id'] = entry.id;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
          child: Stack(
            children: <Widget>[
              ListView(
                children: <Widget>[
                  Theme(
                    data: ThemeData(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      inputDecorationTheme:
                          InputDecorationTheme(border: InputBorder.none),
                    ),
                    child: Form(
                      key: _editEntryFormKey,
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 45),
                          Padding(
                            padding: EdgeInsets.only(bottom: 20.0),
                            child: TextFormField(
                              keyboardType: TextInputType.multiline,
                              minLines: 1,
                              maxLines: 3,
                              cursorColor: Color(0xFF3C4858),
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                hintText: 'What\'s our topic of discussion?',
                              ),
                              initialValue: entry.title,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(100),
                              ],
                              validator: InputValidator.title,
                              onSaved: (value) => _formData['title'] = value,
                            ),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            cursorColor: Color(0xFF3C4858),
                            decoration: InputDecoration.collapsed(
                                hintText:
                                    'Tell me about it, I don\'t snitch 🤐..'),
                            initialValue: entry.content,
                            validator: InputValidator.content,
                            onSaved: (value) => _formData['content'] = value,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  InkResponse(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black12),
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xFF3C4858).withOpacity(.5),
                                offset: Offset(1.0, 10.0),
                                blurRadius: 10.0),
                          ],
                        ),
                        child: Icon(
                          Icons.arrow_downward,
                          semanticLabel: 'Back',
                          size: 22,
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF3C4858),
        child: Provider.of<EntryModel>(context).isLoading
            ? CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.white),
              )
            : Icon(
                Icons.check,
                semanticLabel: 'Save',
              ),
        onPressed: () {
          if (Provider.of<EntryModel>(context).isLoading) return;
          final form = _editEntryFormKey.currentState;
          if (form.validate()) {
            form.save();
            _handleEditEntry();
          }
        },
      ),
    );
  }

  _handleEditEntry() async {
    final statusCode =
        await Provider.of<EntryModel>(context, listen: false).update(_formData);
    if (statusCode != 200) {
      // TODO: LOOK INTO DUPLICATION OF ERROR MESSAGES IN message and message from API
      debugPrint('An error occured');
      String message = "😥 Something went wrong. Please try again later!";

      if (statusCode == 400) {
        message = Provider.of<EntryModel>(context, listen: false).message;
      }
      showDialog(
        context: context,
        builder: (_) => DiaryAlert(
            message: message, onPressed: () => Navigator.of(context).pop()),
      );
      return;
    }
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => DiaryAlert(
          message: "Well recieved 😎! Thanks for the update",
          onPressed: () =>
              Navigator.of(context).popAndPushNamed('list-entries')),
    );
  }
}
