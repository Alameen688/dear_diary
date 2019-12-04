import 'package:cached_network_image/cached_network_image.dart';
import 'package:dear_diary/models/entry.dart';
import 'package:dear_diary/ui/common/diary_confirm_dialog.dart';
import 'package:dear_diary/view_model/entry.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewEntry extends StatefulWidget {
  static const routeName = 'view-entry';

  @override
  _ViewEntryState createState() => _ViewEntryState();
}

class _ViewEntryState extends State<ViewEntry>
    with SingleTickerProviderStateMixin {
  AnimationController _optionsAnimationController;
  Animation<Offset> _optionsAnimation, _optionsDelayedAnimation;

  bool _optionsIsOpen = false;
  @override
  void initState() {
    super.initState();
    _optionsAnimationController =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    _optionsAnimation = Tween<Offset>(begin: Offset(100, 0), end: Offset(0, 0))
        .animate(CurvedAnimation(
            parent: _optionsAnimationController, curve: Curves.easeOutBack))
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener(_setOptionsStatus);
    _optionsDelayedAnimation =
        Tween<Offset>(begin: Offset(100, 0), end: Offset(0, 0)).animate(
            CurvedAnimation(
                parent: _optionsAnimationController,
                curve: Interval(0.2, 1.0, curve: Curves.easeOutBack)));
  }

  @override
  Widget build(BuildContext context) {
    final Entry entry = ModalRoute.of(context).settings.arguments;
    final String heroTag = 'diary-image-${entry.id}';

    return Scaffold(
      body: Stack(
        children: <Widget>[
          ListView(
            padding: EdgeInsets.only(top: 0.0),
            physics: ClampingScrollPhysics(),
            children: <Widget>[
              Stack(
                children: <Widget>[
                  CachedNetworkImage(
                    imageUrl: entry.imageUrl,
                    imageBuilder: (context, imageProvider) => EntryHeaderImage(
                      heroTag: heroTag,
                      imageProvider: imageProvider,
                    ),
                    placeholder: (context, url) => EntryHeaderImage(
                      heroTag: heroTag,
                      imageProvider: AssetImage('images/entry_placeholder_image.jpg'),
                    ),
                    errorWidget: (context, url, error) => EntryHeaderImage(
                      heroTag: heroTag,
                      imageProvider: AssetImage('images/entry_placeholder_image.jpg'),
                    ),
                  ),
                  Positioned(
                    top: 200.0,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        entry.title,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            letterSpacing: 0.8,
                            fontWeight: FontWeight.w700),
                      ),
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
                child: Text(
                  entry.content,
                  style: TextStyle(
                      fontSize: 16.0,
                      height: 1.2,
                      color: Color(0xFF3C4858).withOpacity(0.8)),
                ),
              )
            ],
          ),
          Align(
            alignment: Alignment.topLeft,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                          border: Border.all(color: Colors.black12),
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xFF3C4858).withOpacity(.5),
                                offset: Offset(1.0, 10.0),
                                blurRadius: 10.0),
                          ],
                        ),
                        child: Icon(Icons.arrow_downward,
                            color: Color(0xFF3C4858)),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        InkResponse(
                          onTap: _optionsIsOpen ? _closeOptions : _openOptions,
                          child: Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.only(bottom: 10),
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
                            child: !_optionsIsOpen
                                ? Icon(
                                    Icons.more_vert,
                                    color: Color(0xFF3C4858),
                                  )
                                : Icon(Icons.close, color: Color(0xFF3C4858)),
                          ),
                        ),
                        Transform.translate(
                          offset: _optionsAnimation.value,
                          child: InkResponse(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed('edit-entry', arguments: entry);
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.only(bottom: 10),
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
                                Icons.edit,
                                color: Color(0xFF3C4858),
                                semanticLabel: 'Edit',
                              ),
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: _optionsDelayedAnimation.value,
                          child: InkResponse(
                            onTap: () => _onDeleteClicked(entry.id),
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
                                Icons.delete_outline,
                                color: Colors.red.shade400,
                                semanticLabel: 'Delete',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _setOptionsStatus(AnimationStatus status) {
    setState(() {
      _optionsIsOpen = status == AnimationStatus.forward ||
          status == AnimationStatus.completed;
    });
  }

  void _openOptions() {
    _optionsAnimationController.forward();
  }

  void _closeOptions() {
    _optionsAnimationController.reverse();
  }

  void _onDeleteClicked(int entryId) {
    showDialog(
      context: context,
      builder: (_) => DiaryConfirmDialog(
        message: "Are you sure you want to delete this?",
        onConfirmed: () => _deleteConfirmed(entryId),
      ),
    );
  }

  void _deleteConfirmed(int entryId) async {
    // Navigator.of(context).pop();
    final response = await Provider.of<EntryViewModel>(context, listen: false)
        .delete(entryId);
    if (response) {
      Navigator.of(context).popAndPushNamed('home');
    }
  }

  @override
  void dispose() {
    _optionsAnimationController.dispose();
    super.dispose();
  }
}

class EntryHeaderImage extends StatelessWidget {
  final String heroTag;
  final ImageProvider imageProvider;

  const EntryHeaderImage({
    Key key,
    this.heroTag,
    this.imageProvider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: imageProvider,
      child: Container(
        height: 340.0,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.grey,
          image: DecorationImage(
              colorFilter:
                  ColorFilter.mode(Color(0xFF3C4858), BlendMode.lighten),
              image: imageProvider,
              fit: BoxFit.cover),
        ),
      ),
    );
  }
}
