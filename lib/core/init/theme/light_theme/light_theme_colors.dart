import 'package:flutter/cupertino.dart';

class LightThemeColors {
  static LightThemeColors? _instace;
  static LightThemeColors? get instance {
    _instace ??= LightThemeColors._init();
    return _instace;
  }

  LightThemeColors._init();

  Color wizardWhite = const Color(0xFFE3EEFF);
  Color white = const Color(0xFFFFFFFF);
  Color lustfulWishes = const Color(0xFF002359);
  Color blueSkiesToday = const Color(0xFF8FAFE0);
  Color washMe = const Color(0xFFFAFCFF);
}
