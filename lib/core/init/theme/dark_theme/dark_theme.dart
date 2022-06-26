import 'package:flutter/material.dart';
import 'package:world_time/core/constants/app_constants/app_constants.dart';
import 'package:world_time/core/init/theme/dark_theme/dark_theme_colors.dart';


class DarkTheme {
  static DarkTheme? _instace;
  static DarkTheme? get instance {
    _instace ??= DarkTheme._init();
    return _instace;
  }

  DarkTheme._init();

  ThemeData lightTheme = ThemeData(
    iconTheme: IconThemeData(color:DarkThemeColors.instance!.white ),
    scaffoldBackgroundColor: DarkThemeColors.instance!.lustfulWishes,
      
      fontFamily: ApplicationConstants.APP_ASSET_FONT,
      inputDecorationTheme: InputDecorationTheme(fillColor: DarkThemeColors.instance!.white,filled: true,focusedBorder: _outlineInputBorder,enabledBorder:_outlineInputBorder),
      colorScheme: ColorScheme.light(
          primary: DarkThemeColors.instance!.washMe, secondary: DarkThemeColors.instance!.darkMidnightBlue,surface:DarkThemeColors.instance!.lustfulWishes,outline: DarkThemeColors.instance!.lustfulWishesLowOpacity,secondaryContainer: DarkThemeColors.instance!.white,onSurface: DarkThemeColors.instance!.darkMidnightBlue,onSecondaryContainer: DarkThemeColors.instance!.darkMidnightBlue,tertiary: DarkThemeColors.instance!.lustfulWishes),
      textTheme: TextTheme(
          headline1: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w600,
        color: DarkThemeColors.instance!.washMe
      ),headline2: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
color: DarkThemeColors.instance!.washMe      ),subtitle1: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w300,
color: DarkThemeColors.instance!.washMe      ),
      subtitle2: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
color: DarkThemeColors.instance!.washMe      )
      ));
}

final OutlineInputBorder _outlineInputBorder=OutlineInputBorder(borderSide: BorderSide(color: DarkThemeColors.instance!.darkMidnightBlue),borderRadius: const BorderRadius.all(Radius.circular(92)));