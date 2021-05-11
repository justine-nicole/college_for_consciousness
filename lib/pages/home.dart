import 'package:college_for_consciousness/app/app_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


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
      color: AppColors.palePeachPage,

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
              //this is the appbar that's getting picked up/////////////////////
              appBar: AppBar(
                title: Text('College for Consciousness'),
                backgroundColor: AppColors.clearNavy,
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
                        // LEFT COLUMN ZONE ////////////////////////////////////
                        child: Container(
                          height: 955,
                          color: AppColors.palePeachPage,
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
                            // HERO SECTION ////////////////////////////////////
                            Container(
                              height: 250,
                              color: AppColors.brightLime,
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
                              // SECTION B BELOW MAP /////////////////////////////////////
                              child: Container(
                                height: 200,
                                color: AppColors.truePeach,
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              // SECTION C BELOW MAP ///////////////////////////////////////
                              child: Container(
                                height: 200,
                                color: AppColors.duskyBlue,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        //RIGHT COLUMN ZONE ////////////////////////////////////
                        child: Container(
                          height: 955,
                          color: AppColors.palePeachPage,
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