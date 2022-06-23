import 'package:flutter/material.dart';

class DarkThemeColors {
  static DarkThemeColors? _instace;
  static DarkThemeColors? get instance {
    _instace ??= DarkThemeColors._init();
    return _instace;
  }

  DarkThemeColors._init();

  Color darkMidnightBlue = const Color(0xFF02327D);
    Color washMe = const Color(0xFFFAFCFF);
  Color lustfulWishes = const Color(0xFF002359);
  Color wizardWhiteLowOpacity = const Color(0xFFE3EEFF).withOpacity(0.2);
  Color white = const Color(0xFFFFFFFF);




}
