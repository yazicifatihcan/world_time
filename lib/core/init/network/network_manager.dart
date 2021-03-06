import 'dart:convert';
import 'package:world_time/core/constants/api_constants/api_constants.dart';
import 'package:http/http.dart' as http;
import 'package:world_time/product/model/district_time_model.dart';

class NetworkManager {
  static NetworkManager? _instace;
  static NetworkManager? get instance {
    _instace ??= NetworkManager._init();
    return _instace;
  }

  NetworkManager._init();

  Future<List?> getTimeZones() async {
    try {
      Uri url = Uri.parse(ApiConstants.instance.baseUrl);
      var res = await http.get(url);
      return jsonDecode(res.body);
    } catch (e) {
      return null;
    }
  }

  Future<DistrictTimeData?> getDistrictTimeData(String path) async {
    try {
      Uri url = Uri.parse(ApiConstants.instance.baseUrl + "/$path");
      var res = await http.get(url);
      return DistrictTimeData.fromJson(jsonDecode(res.body));
    } catch (e) {
      return null;
    }
  }
}
