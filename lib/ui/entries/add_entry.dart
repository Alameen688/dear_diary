import 'package:dear_diary/utils/input_validator.dart';
import 'package:dear_diary/view_model/base.dart';
import 'package:dear_diary/view_model/entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class AddEntry extends StatefulWidget {
  static const routeName = 'add-entry';

  AddEntry({Key key}) : super(key: key);

  _AddEntryState createState() => _AddEntryState();
}

class _AddEntryState extends State<AddEntry> {
  Map<String, String> _formData = {};
  final _addEntryFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
                      key: _addEntryFormKey,
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
        child: Provider.of<EntryViewModel>(context).viewStatus ==
                ViewStatus.Loading
            ? CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.white),
              )
            : Icon(
                Icons.check,
                semanticLabel: 'Save',
              ),
        onPressed: () {
          if (Provider.of<EntryViewModel>(context).viewStatus ==
              ViewStatus.Loading) return;
          final form = _addEntryFormKey.currentState;
          if (form.validate()) {
            form.save();
            _handleAddEntry();
          }
        },
      ),
    );
  }

  _handleAddEntry() async {
    final response = await Provider.of<EntryViewModel>(context, listen: false)
        .create(_formData);
    if (response) {
      Navigator.of(context).pushNamed('home');
    }
  }
}
