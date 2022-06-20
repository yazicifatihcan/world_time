class DarkThemeColors {
  static DarkThemeColors? _instace;
  static DarkThemeColors? get instance {
    _instace ??= DarkThemeColors._init();
    return _instace;
  }

  DarkThemeColors._init();
}