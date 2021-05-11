import 'package:college_for_consciousness/app/app_colors.dart';
import 'package:college_for_consciousness/widgets/layer_item.dart';
import 'package:flutter/material.dart';

class ClickableMap extends StatelessWidget {
  const ClickableMap({
    Key? key,
    required double sizeReferenceNumber,
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