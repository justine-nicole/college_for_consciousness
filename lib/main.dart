import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  String _title = 'College for Consciousness';

  @override
    Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      // theme: AppTheme.themeTopLevel(),
        // Adjust design to define colors, text styles, themes, etc.
        // in the app_theme class. See lib/app/app_theme.dart
      home: Home(title: _title),
    );
  }
  }

  class Home extends StatelessWidget{
  String title;

  String _title;

  Home({
    Key key,
    this.title,
  })  : _title = title,
        super(key: key);

  @override
      Widget build(BuildContext context) {
    return Scaffold(
      // Gives access to AppBar, Drawer, Floating Action Button & more
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text (_title),
      ),
      backgroundColor: Colors.white,
      body: PageContent(),
    );
  }
  }

class PageContent extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget> [
        Container(
          // left container
          alignment: Alignment.topLeft,
          // add margin of separation around container
          margin: EdgeInsets.only(top: 10, bottom: 10, right: 100, left: 10),
          height: 100,
          width: MediaQuery.of(context).size.width / 6,
          color: Colors.pink,
          // add border
          decoration: BoxDecoration(
            border: Border.all(width: 2.0, color: const Color(0x55000000)),
          ),
        ),
        Container(
          // right container
          alignment: Alignment.topRight,
          // add margin of separation around container
          margin: EdgeInsets.only(top: 10, bottom: 10, right: 10, left: 100),
          height: 100,
          width: MediaQuery.of(context).size.width / 6,
          color: Colors.deepOrange,
          // add border
          decoration: BoxDecoration(
            border: Border.all(width: 2.0, color: const Color(0x55000000)),
          ),
        ),
        Expanded(
          child: Container (
            // add margin to match vertical separation
            margin: EdgeInsets.only(top: 10, bottom: 10, right: 0, left: 0),
            height: 100,
            color: Colors.amber,
            // add border
            decoration: BoxDecoration(
              border: Border.all(width: 2.0, color: const Color(0x55000000)),
            ),
          ),
        ),
        // Use Expanded to eat up space at the bottom
        Expanded(
          child: SizedBox(
            width: 1,
            height: 1,
          ),
        ),
      ],
    );
  }
  }