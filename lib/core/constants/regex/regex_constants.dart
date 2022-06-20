class RegexConstants {
  static RegexConstants? _instace;

  static RegexConstants get instance => _instace ??= RegexConstants._init();

  RegexConstants._init();
  final RegExp nameRegExp = RegExp('[a-zA-Z]');
}