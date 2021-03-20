import 'dart:math' as math;
import 'package:flutter/material.dart';

import 'package:flutter/gestures.dart';

class Home extends StatefulWidget {
  Home({
    Key key,
  }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //*************************************
  // Dumb test variables for trying ideas
  bool menuButtonToggle = false;

  void toggleTopMenuButton() {
    setState(() {
      menuButtonToggle == true
          ? menuButtonToggle = false
          : menuButtonToggle = true;
    });
  }
  //*************************************

  final scrollController = ScrollController();

  double topMenuWhiteBarHeight = 0;
  double currentScrollLocation = 0;

  // Adjust these two if the scrolling feels like it's not right
  int millisecondsItTakesToMoveOneScrollWheelClick = 125;
  int scrollThisManyPixelsPerScrollWheelClick = 100;

  // Sidebars increase and decrease width between 100 and 200, depending on window width
  double calculateSideWindowsWidth(double contentAreaWidth) {
    // Set maximums and minimums
    const double sidebarMaxWith = 200;
    const double sidebarMinWidth = 100;
    const double contentAreaMaxWith = 1200;
    const double contentAreaMinWidth = 700;
    if (contentAreaWidth > 1200) contentAreaWidth = contentAreaMaxWith;
    if (contentAreaWidth < 700) contentAreaWidth = contentAreaMinWidth;
    // Calculate the width available for all content
    final double contentAreaRange = contentAreaMaxWith - contentAreaMinWidth;
    // Calculate the percentage of available content width is actually being used
    final double currentPercentageOfContentAreaRangeUsed =
        (contentAreaWidth - contentAreaMinWidth) / contentAreaRange;
    // Adjust sidebar widths in accordance with that percentage,
    // but make them no smaller or larger than the sidebar min and max set above
    final double calculatedWindowWidth =
        (currentPercentageOfContentAreaRangeUsed *
            (sidebarMaxWith - sidebarMinWidth)) +
            sidebarMinWidth;
    return calculatedWindowWidth;
  }

  // Hide the white menu bar anytime the scroll is at the start. Show it otherwise.
  void showTopMenuWhiteBar() {
    setState(() {
      if (topMenuWhiteBarHeight == 40) {
        if (currentScrollLocation == 0) {
          topMenuWhiteBarHeight = 0;
        }
      } else {
        if (currentScrollLocation != 0) {
          topMenuWhiteBarHeight = 40;
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    double _windowHeight = MediaQuery.of(context).size.height;
    double _windowWidth = MediaQuery.of(context).size.width;
    double _screenAspectRatio = _windowWidth / _windowHeight;
    double _contentWidth = _windowWidth > 1200.0 ? 1200.0 : _windowWidth;

    // TODO Get rid of this print
    print('\nAspectRatio of the window is $_screenAspectRatio\n'
        '(3:4 is 0.75 and 16:9 is 1.777...)');

    return Container(
      /// Background Color and Centering
      height: double.infinity,
      width: _windowWidth,
      alignment: Alignment.center,
      color: Color(0xFFF9F9F9),

      /// Page Area Full Width
      child: Center(
        child: NotificationListener<ScrollUpdateNotification>(
          child: Listener(
            onPointerSignal: (pointerSignal) {
              int millis = millisecondsItTakesToMoveOneScrollWheelClick;
              if (pointerSignal is PointerScrollEvent) {
                if (pointerSignal.scrollDelta.dy > 0) {
                  currentScrollLocation +=
                      scrollThisManyPixelsPerScrollWheelClick;
                } else {
                  currentScrollLocation -=
                      scrollThisManyPixelsPerScrollWheelClick;
                }
                if (currentScrollLocation >
                    scrollController.position.maxScrollExtent) {
                  currentScrollLocation =
                      scrollController.position.maxScrollExtent;
                  millis =
                      millisecondsItTakesToMoveOneScrollWheelClick ~/ 2;
                } else if (currentScrollLocation < 0) {
                  currentScrollLocation = 0;
                  millis =
                      millisecondsItTakesToMoveOneScrollWheelClick ~/ 2;
                }

                scrollController.animateTo(
                  currentScrollLocation,
                  duration: Duration(milliseconds: millis),
                  curve: Curves.linear,
                );
              }
            },


            child:     Scaffold(
              appBar: AppBar(
                title: Text('School of Consciousness'),
              ),
              body: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                controller: scrollController,
                child: Container(
                  alignment: Alignment.topCenter,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 300,
                          color: Colors.green,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child:

                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              height: 100,
                              color: Colors.yellow,
                            ),
                            Flexible(
                              child: LayoutBuilder(
                                builder: (BuildContext ctx, BoxConstraints constraints) {
                                  double _sizeReference =
                                  math.min(constraints.maxHeight, constraints.maxWidth);
                                  //        if(_sizeReference > 300) _sizeReference = 300;
                                  return AspectRatio(
                                    aspectRatio: 1,
                                    child:
                                    ClickableMap(sizeReferenceNumber: _sizeReference),
                                  );
                                },
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Container(
                                height: 300,
                                color: Colors.purple,
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Container(
                                height: 300,
                                color: Colors.pink,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 300,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          onNotification: (notification) {
            currentScrollLocation = notification.metrics.pixels;
            showTopMenuWhiteBar();
            return true;
          },
        ),
      ),
    );
  }
}

// *************************************************************
// *************************************************************
// *************************************************************
// *************************************************************
// *************************************************************

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
      title: 'Clickable Image Map',
      home: Material(child: Home()),
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

// void calculateSizeOfMap(
//     {@required double windowHeight, @required double windowWidth}) {
//   //*****************************************
//   // Set whatever percentage of window width you want for
//   // the height and width of the map here
//   //*****************************************
//   _sizeReferenceNumber = math.min(windowHeight, windowWidth) * 0.5;
// }

  @override
  Widget build(BuildContext context) {
    double _windowHeight = MediaQuery.of(context).size.height;
    double _windowWidth = MediaQuery.of(context).size.width;
    // calculateSizeOfMap(windowHeight: _windowHeight, windowWidth: _windowWidth);
    //*****************************************
    // This takes up the whole window and gives it a background gray color
    //*****************************************
    return Scaffold(
      appBar: AppBar(
        title: Text('College For Consciousness'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: 300,
                color: Colors.green,
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 100,
                    color: Colors.yellow,
                  ),
                  LayoutBuilder(
                    builder: (BuildContext ctx, BoxConstraints constraints) {
                      double _sizeReference =
                      math.min(constraints.maxHeight, constraints.maxWidth);
                      if(_sizeReference > 300) _sizeReference = 300;
                      return AspectRatio(
                        aspectRatio: 1,
                        child:
                        ClickableMap(sizeReferenceNumber: _sizeReference),
                      );
                    },
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 300,
                      color: Colors.purple,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 300,
                      color: Colors.pink,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                height: 300,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ClickableMap extends StatelessWidget {
  const ClickableMap({
    Key key,
    @required double sizeReferenceNumber,
  })  : _sizeReferenceNumber = sizeReferenceNumber,
        super(key: key);

  final double _sizeReferenceNumber;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        print('Base Layer'),
      },
      //*****************************************
      // White box
      //*****************************************
      child: Container(
        height: _sizeReferenceNumber,
        width: _sizeReferenceNumber,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 2,
            color: Colors.black87,
          ),
        ),
        //*****************************************
        // The start of the stack
        //*****************************************
        child: Stack(
          children: <Widget>[
            //*****************************************
            // Layer one, the lowest white shape
            //*****************************************
            LayerItem(
                callback: () => print('Layer 1'),
                top: _sizeReferenceNumber * 0.6,
                left: _sizeReferenceNumber * 0.25,
                height: _sizeReferenceNumber * 0.2,
                width: _sizeReferenceNumber * 0.3,
                color: Colors.white,
                borderColor: Color(0x33000000),
                borderWidth: 2,
                borderRadius: _sizeReferenceNumber * 0.1),
            //*****************************************
            // Layer two, the middle-height white shape
            //*****************************************
            LayerItem(
              callback: () => print('Layer 2'),
              top: _sizeReferenceNumber * 0.5,
              left: _sizeReferenceNumber * 0.15,
              height: _sizeReferenceNumber * 0.2,
              width: _sizeReferenceNumber * 0.3,
              color: Color(0xFF8E24AA),
              borderColor: Color(0x33000000),
              borderWidth: 2,
              borderRadius: _sizeReferenceNumber * 0.1,
            ),
            //*****************************************
            // Layer three, the translucent purple shape
            //*****************************************
            LayerItem(
              callback: () => print('Layer 3'),
              top: _sizeReferenceNumber * 0.3,
              left: _sizeReferenceNumber * 0.4,
              height: _sizeReferenceNumber * 0.5,
              width: _sizeReferenceNumber * 0.5,
              color: Colors.green,
              borderColor: Color(0x33000000),
              borderWidth: 2,
              borderRadius: _sizeReferenceNumber * 0.25,
            ),
          ],
        ),
      ),
    );
  }
}

class LayerItem extends StatelessWidget {
  const LayerItem({
    Key key,
    @required this.callback,
    @required this.top,
    @required this.left,
    @required this.height,
    @required this.width,
    @required this.color,
    @required this.borderColor,
    @required this.borderWidth,
    @required this.borderRadius,
  }) : super(key: key);

  final VoidCallback callback;
  final double top;
  final double left;
  final double height;
  final double width;
  final Color color;
  final Color borderColor;
  final double borderWidth;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      child: GestureDetector(
        onTap: callback,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: color,
            border: Border.all(
              color: borderColor,
              width: borderWidth,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius),
            ),
          ),
        ),
      ),
    );
  }
}