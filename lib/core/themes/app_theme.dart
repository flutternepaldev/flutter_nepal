import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/my_colors.dart';

class AppTheme {
  const AppTheme._();
  static final lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: MyColors.flagRedColor,
      secondary: MyColors.flagBlueColor,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: GoogleFonts.comicNeue().fontFamily,
  );

  static final darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: MyColors.flagRedColor,
      secondary: MyColors.flagBlueColor,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: GoogleFonts.comicNeue().fontFamily,
  );
}
