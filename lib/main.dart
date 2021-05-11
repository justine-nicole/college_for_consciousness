import 'package:college_for_consciousness/app/app_strings.dart';
import 'package:college_for_consciousness/pages/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //*****************************************
      // This is the title that will appear inside the browser tab
      //*****************************************
      title: AppStrings.appBarTitle,

      home: Material(
        child: Home(),
      ),
    );
  }
}
