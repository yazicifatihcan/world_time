import 'package:flutter/material.dart';
import 'package:world_time/core/init/theme/light_theme/light_theme_colors.dart';

class LightTheme {
  static LightTheme? _instace;
  static LightTheme? get instance {
    _instace ??= LightTheme._init();
    return _instace;
  }

  LightTheme._init();


  

  ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: LightThemeColors.instance!.washMe,
      fontFamily: "Montserrat",
      inputDecorationTheme: InputDecorationTheme(fillColor: LightThemeColors.instance!.white,filled: true,focusedBorder: _outlineInputBorder,enabledBorder:_outlineInputBorder),
      colorScheme: ColorScheme.light(
          primary: LightThemeColors.instance!.lustfulWishes, secondary: LightThemeColors.instance!.wizardWhite,),
      textTheme: TextTheme(
          headline1: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w600,
        color: LightThemeColors.instance!.lustfulWishes
      ),headline2: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: LightThemeColors.instance!.lustfulWishes
      ),subtitle1: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w300,
        color: LightThemeColors.instance!.lustfulWishes
      )));
}

final OutlineInputBorder _outlineInputBorder=OutlineInputBorder(borderSide: BorderSide(color: LightThemeColors.instance!.blueSkiesToday),borderRadius: const BorderRadius.all(Radius.circular(92)));