import 'package:flutter/material.dart';
import 'package:world_time/core/constants/app_constants/app_constants.dart';
import 'package:world_time/core/init/theme/light_theme/light_theme_colors.dart';

class LightTheme {
  static LightTheme? _instace;
  static LightTheme? get instance {
    _instace ??= LightTheme._init();
    return _instace;
  }

  LightTheme._init();


  

  ThemeData lightTheme = ThemeData(
    iconTheme: IconThemeData(color:LightThemeColors.instance!.lustfulWishes ),
    scaffoldBackgroundColor: LightThemeColors.instance!.washMe,
      fontFamily: ApplicationConstants.APP_ASSET_FONT,
      inputDecorationTheme: InputDecorationTheme(fillColor: LightThemeColors.instance!.white,filled: true,focusedBorder: _outlineInputBorder,enabledBorder:_outlineInputBorder),
      colorScheme: ColorScheme.light(
          primary: LightThemeColors.instance!.lustfulWishes, secondary: LightThemeColors.instance!.wizardWhite,surface:LightThemeColors.instance!.washMe,outline: LightThemeColors.instance!.wizardWhiteLowOpacity,secondaryContainer: LightThemeColors.instance!.white,onSurface: LightThemeColors.instance!.lustfulWishes, onSecondaryContainer: LightThemeColors.instance!.white,tertiary: LightThemeColors.instance!.lustfulWishes),
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
      ),
      subtitle2: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: LightThemeColors.instance!.lustfulWishes
      )
      ));
}

final OutlineInputBorder _outlineInputBorder=OutlineInputBorder(borderSide: BorderSide(color: LightThemeColors.instance!.blueSkiesToday),borderRadius: const BorderRadius.all(Radius.circular(92)));