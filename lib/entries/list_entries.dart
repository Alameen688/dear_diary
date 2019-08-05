import 'package:dear_diary/data/entry_test_data.dart';
import 'package:flutter/material.dart';

class ListEntries extends StatefulWidget {
  @override
  _ListEntriesState createState() => _ListEntriesState();
}

class _ListEntriesState extends State<ListEntries> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: ListView.builder(
              itemCount: entriesData.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 15.0, top: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      LimitedBox(
                        maxWidth: MediaQuery.of(context).size.width * .9,
                        maxHeight: 280,
                        child: Stack(
                          children: <Widget>[
                            Container(
                              width: 200,
                              height: 250,
                              margin: EdgeInsets.only(left: 100),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    colorFilter: ColorFilter.mode(
                                        Color(0xFF3C4858), BlendMode.lighten),
                                    image: AssetImage(
                                      entriesData[index].imageUrl,
                                    ),
                                    fit: BoxFit.cover),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color(0xFF3C4858).withOpacity(.4),
                                      offset: Offset(5.0, 5.0),
                                      blurRadius: 10.0),
                                ],
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
                                        entriesData[index].title,
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
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Text(entriesData[index].date),
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
                );
              }),
        ),
        bottomNavigationBar: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), title: Text('Profile'))
            ]),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFF3C4858),
          onPressed: () => debugPrint('add entry'),
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked);
  }
}
