class ApiConstants {
  static ApiConstants? _instace;

  static ApiConstants get instance => _instace ??= ApiConstants._init();

  ApiConstants._init();

  String baseUrl="http://worldtimeapi.org/api/timezone";
}