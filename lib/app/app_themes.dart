// import 'dart:html';    // unused

import 'package:college_for_consciousness/app/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData light() {
     final textTheme = _getTextTheme(brightness: Brightness.light);

    return ThemeData(
      backgroundColor: AppColors.palePeachPage,
      scaffoldBackgroundColor: AppColors.palePeachPage,
      primaryColor: AppColors.darkTan,
      accentColor: AppColors.brightLime,
      buttonColor: AppColors.yellowGreen,
      textTheme: textTheme,
      primaryTextTheme: textTheme,
      dividerTheme: _dividerTheme,
      elevatedButtonTheme: _elevatedButtonTheme,
    );
  }

//  TODO: add dark mode if desired
// static ThemeData dark() {
//   final textTheme = _getTextTheme(brightness: Brightness.dark);

//   return ThemeData(
//     brightness: Brightness.dark,
//     primaryColor: _primaryColor,
//     accentColor: _accentColor,
//     textTheme: textTheme,
//     primaryTextTheme: textTheme,
//     dividerTheme: _dividerTheme,
//     elevatedButtonTheme: _elevatedButtonTheme,
//   );
// }

  // static const _primaryColor = Colors.black;
  // static const _accentColor = Colors.white;


  // Dividers
  static const _dividerTheme = DividerThemeData(
    indent: 16,
    space: 0,
  );


  // Buttons
  static final _elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: AppColors.yellowGreen,
      onPrimary: AppColors.paleBlue,
    ),
  );


  // Text
  static TextTheme _getTextTheme({Brightness brightness}) {
    final themeData = ThemeData(brightness: brightness);

    return GoogleFonts.exo2TextTheme(themeData.textTheme).copyWith(
      headline1: GoogleFonts.nunito(),
      headline2: GoogleFonts.nunito(),
      headline3: GoogleFonts.nunito(),
      headline4: GoogleFonts.nunito(),
      headline5: GoogleFonts.nunito(),
      headline6: GoogleFonts.nunito(),
    );
  }
}
