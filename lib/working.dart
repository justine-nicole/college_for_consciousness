// import 'dart:html';
import 'dart:math' as math;
import 'package:college_for_consciousness/app/app_colors.dart';
import 'package:college_for_consciousness/app/app_strings.dart';
import 'package:flutter/material.dart';








// *************************************************************
// *************************************************************
// *************************************************************
// *************************************************************
// *************************************************************



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
        backgroundColor: AppColors.clearNavy,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                height: 500,
                color: Colors.green,
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // AREA BEHIND CLICKABLE MAP /////////////////////////////////
                  Container(
                    height: 100,
                    color: AppColors.palePeachPage,
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
                    // where is this???  //////////////////////////////////////////////
                    child: Container(
                      height: 300,
                      color: Colors.purple,
                      ),
                    ),
                  Expanded(
                    flex: 1,
                    // where is this??? /////////////////////////////////////////////
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
              // where is this? /////////////////////////////////////////////////////
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

// CLICKABLE MAP AREA /////////////////////////////////////////////////////////////////////////////
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
          color: AppColors.palePeachPage,
          border: Border.all(
            width: 2,
            color: AppColors.darkTan,
          ),
        ),
        //*****************************************
        // The start of the stack
        //*****************************************
        child: Stack(
          children: <Widget>[
            //*****************************************
            // Layer one, the lowest partial oval shape
            //*****************************************
            LayerItem(
                callback: () => print('Layer 1'),
                top: _sizeReferenceNumber * 0.6,
                left: _sizeReferenceNumber * 0.25,
                height: _sizeReferenceNumber * 0.2,
                width: _sizeReferenceNumber * 0.3,
                color: AppColors.lightPink,
                borderColor: AppColors.darkTan,
                borderWidth: 2,
                borderRadius: _sizeReferenceNumber * 0.1),
            //*****************************************
            // Layer two, the oval shape
            //*****************************************
            LayerItem(
              callback: () => print('Layer 2'),
              top: _sizeReferenceNumber * 0.5,
              left: _sizeReferenceNumber * 0.15,
              height: _sizeReferenceNumber * 0.2,
              width: _sizeReferenceNumber * 0.3,
              color: AppColors.brightLime,
              borderColor: AppColors.darkTan,
              borderWidth: 2,
              borderRadius: _sizeReferenceNumber * 0.1,
            ),
            //*****************************************
            // Layer three, the circle shape
            //*****************************************
            LayerItem(
              callback: () => print('Layer 3'),
              top: _sizeReferenceNumber * 0.3,
              left: _sizeReferenceNumber * 0.4,
              height: _sizeReferenceNumber * 0.5,
              width: _sizeReferenceNumber * 0.5,
              color: AppColors.lightOrange,
              borderColor: AppColors.darkTan,
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