import 'package:dear_diary/data/entry_test_data.dart';
import 'package:dear_diary/models/entry.dart';
import 'package:dear_diary/view_model/base.dart';
import 'package:dear_diary/view_model/entry.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListEntries extends StatefulWidget {
  @override
  _ListEntriesState createState() => _ListEntriesState();
}

class _ListEntriesState extends State<ListEntries> {
  EntryViewModel entryViewModel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final entryViewModel = Provider.of<EntryViewModel>(context);
    if (this.entryViewModel != entryViewModel) {
      this.entryViewModel = entryViewModel;
      Future.microtask(entryViewModel.getEntries);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<EntryViewModel>(builder: (context, model, child) {
        List<Entry> entries = model.entries;
        if (model.viewStatus == ViewStatus.Loading) return LoadingView();
        if (entries.length < 1) return EmptyView();
        return ListView.builder(
            itemCount: entries.length,
            itemBuilder: (BuildContext context, int index) {
              final Entry entry = entries[index];
              return GestureDetector(
                onTap: () => Navigator.of(context)
                    .pushNamed('view-entry', arguments: entry),
                child: Container(
                  margin: EdgeInsets.only(bottom: 15.0, top: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      LimitedBox(
                        maxWidth: MediaQuery.of(context).size.width * .9,
                        maxHeight: 280,
                        child: Stack(
                          children: <Widget>[
                            Hero(
                              tag: "diary-image-$index",
                              child: Container(
                                width: 200,
                                height: 250,
                                margin: EdgeInsets.only(left: 100),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      colorFilter: ColorFilter.mode(
                                          Color(0xFF3C4858), BlendMode.lighten),
                                      image: AssetImage(
                                        entriesData[index < 5 ? index : 1]
                                            .imageUrl,
                                      ),
                                      fit: BoxFit.cover),
                                  boxShadow: [
                                    BoxShadow(
                                        color:
                                            Color(0xFF3C4858).withOpacity(.4),
                                        offset: Offset(5.0, 5.0),
                                        blurRadius: 10.0),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0.0,
                              top: 30.0,
                              //the center = (height of image container/2) - (height of this container/2)
                              child: Container(
                                width: 180,
                                height: 190,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.0),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black12,
                                          offset: Offset(0.0, 0.0),
                                          blurRadius: 10.0),
                                    ]),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        entry.title,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.0),
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Icon(
                                                  Icons.event_note,
                                                  size: 18.0,
                                                  color: Color(0xFF3C4858),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(entry.createdAt),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: <Widget>[
                                                Icon(
                                                  Icons.arrow_forward,
                                                  size: 26.0,
                                                  color: Colors.blueGrey,
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            });
      }),
    );
  }
}

class EmptyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(bottom: 15.0),
          child: Text(
            'No entries yet',
            style: TextStyle(fontSize: 20.0),
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: Text('Click the + button to start writing'),
        )
      ],
    );
  }
}

class LoadingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(bottom: 20),
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Color(0xFF3C4858)),
          ),
        ),
        Text('Fetching your entries '),
      ],
    );
  }
}
