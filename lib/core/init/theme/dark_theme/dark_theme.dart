import 'package:flutter/material.dart';


class DarkTheme {
  static DarkTheme? _instace;
  static DarkTheme? get instance {
    _instace ??= DarkTheme._init();
    return _instace;
  }

  DarkTheme._init();

  ThemeData darkTheme = ThemeData();
}
