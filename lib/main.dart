import 'package:flutter/material.dart';

void main() {
runApp(MyApp());
}

class MyApp extends StatelessWidget {
@override
Widget build(BuildContext context) {
return MaterialApp(
//*****************************************
// This is the title that will appear inside the browser tab
//*****************************************
title: 'College for Consciousness',
home: Material(child: ClickableImageMap()),
);
}
}

class ClickableImageMap extends StatefulWidget {
ClickableImageMap({
Key key,
}) : super(key: key);

@override
_ClickableImageMapState createState() => _ClickableImageMapState();
}

class _ClickableImageMapState extends State<ClickableImageMap> {
double _keySizeCalculationsOffThisNumber;

void calculateSizeOfMap(double windowWidth) {
//*****************************************
// Set whatever percentage of window width you want for
// the height and width of the map here
//*****************************************
_keySizeCalculationsOffThisNumber = windowWidth * 0.5;
}

@override
Widget build(BuildContext context) {
double _windowWidth = MediaQuery.of(context).size.width;
calculateSizeOfMap(_windowWidth);
//*****************************************
// This takes up the whole window and gives it a background gray color
//*****************************************
return Container(
alignment: Alignment.center,
height: double.infinity,
width: double.infinity,
color: Color(0xFFDDDDDD),
child: Container(
height: _keySizeCalculationsOffThisNumber,
width: _keySizeCalculationsOffThisNumber,
decoration: BoxDecoration(
border: Border.all(
width: 2,
color: Colors.black45,
),
),
//*****************************************
// The start of the stack
//*****************************************
child: Stack(
children: <Widget>[
//*****************************************
// White box
//*****************************************
GestureDetector(
onTap: () => {
print('Base Layer'),
},
child: Container(
height: _keySizeCalculationsOffThisNumber,
width: _keySizeCalculationsOffThisNumber,
color: Colors.white,
),
),
//*****************************************
// Layer one, the lowest white shape
//*****************************************
Positioned(
top: _keySizeCalculationsOffThisNumber * .6,
left: _keySizeCalculationsOffThisNumber * .25,
child: GestureDetector(
onTap: () => {
print('Layer 1'),
},
child: Container(
height: _keySizeCalculationsOffThisNumber * .2,
width: _keySizeCalculationsOffThisNumber * .3,
decoration: BoxDecoration(
color: Colors.white,
border: Border.all(
color: Color(0x33000000),
width: 2,
),
borderRadius: BorderRadius.all(
Radius.circular(_keySizeCalculationsOffThisNumber * .1),
),
),
),
),
),
//*****************************************
// Layer two, the middle-height white shape
//*****************************************
Positioned(
top: _keySizeCalculationsOffThisNumber * .5,
left: _keySizeCalculationsOffThisNumber * .15,
child: GestureDetector(
onTap: () => {
print('Layer 2'),
},
child: Container(
height: _keySizeCalculationsOffThisNumber * .2,
width: _keySizeCalculationsOffThisNumber * .3,
decoration: BoxDecoration(
color: Colors.white,
border: Border.all(
color: Color(0x33000000),
width: 2,
),
borderRadius: BorderRadius.all(
Radius.circular(_keySizeCalculationsOffThisNumber * .1),
),
),
),
),
),
//*****************************************
// Layer three, the translcent purple shape
//*****************************************
Positioned(
top: _keySizeCalculationsOffThisNumber * .3,
left: _keySizeCalculationsOffThisNumber * .4,
child: GestureDetector(
onTap: () => {
print('Layer 3'),
},
child: Container(
height: _keySizeCalculationsOffThisNumber * .5,
width: _keySizeCalculationsOffThisNumber * .5,
decoration: BoxDecoration(
color: Color(0x778E24AA),
border: Border.all(
color: Color(0x33000000),
width: 2,
),
borderRadius: BorderRadius.all(
Radius.circular(_keySizeCalculationsOffThisNumber * .25),
),
),
),
),
),
],
),
),
);
}
}

