import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  String _title = 'College for Consciousness';

  @override
    Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: AppTheme.themeTopLevel(),
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
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text (_title),
      ),
      backgroundColor: Colors.white,
      body: PageContent(),
    );
  }
  }