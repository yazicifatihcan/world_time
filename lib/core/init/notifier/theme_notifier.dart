import 'package:flutter/material.dart';
import 'package:world_time/core/constants/enums/preference_keys.dart';
import 'package:world_time/core/init/cache/locale_manager.dart';
import 'package:world_time/core/init/theme/dark_theme/dark_theme.dart';
import 'package:world_time/core/init/theme/light_theme/light_theme.dart';

import '../../constants/enums/app_theme_enum.dart';

class ThemeNotifier extends ChangeNotifier {
  late ThemeData _currentTheme;

  late AppThemes _currenThemeEnum;

  AppThemes get currenThemeEnum => _currenThemeEnum;

  ThemeData get currentTheme => _currentTheme;

  ThemeNotifier({required bool isLight}) {
    _currentTheme = isLight
        ? LightTheme.instance!.lightTheme
        : DarkTheme.instance!.lightTheme;
    _currenThemeEnum = isLight ? AppThemes.light : AppThemes.dark;
  }

  void changeTheme() {
    if (_currenThemeEnum == AppThemes.light) {
      _currentTheme = DarkTheme.instance!.lightTheme;
      _currenThemeEnum = AppThemes.dark;
      LocaleManager.instance.setBoolValue(PreferencesKeys.isThemeLight, false);
    } else {
      _currentTheme = LightTheme.instance!.lightTheme;

      _currenThemeEnum = AppThemes.light;
      LocaleManager.instance.setBoolValue(PreferencesKeys.isThemeLight, true);
    }
    notifyListeners();
  }
}
