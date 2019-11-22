import 'package:dear_diary/ui/common/slide_up_route.dart';
import 'package:dear_diary/ui/entries/add_entry.dart';
import 'package:dear_diary/ui/entries/list_entries.dart';
import 'package:dear_diary/ui/profile/profile.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  static const routeName = 'home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _pages = [ListEntries(), Profile()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: _pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: _onBottomNavTapped,
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
          child: Icon(Icons.add),
          onPressed: () =>
              Navigator.of(context).push(SlideUpRoute(widget: AddEntry())),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked);
  }

  void _onBottomNavTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
