import 'package:shared_preferences/shared_preferences.dart';
import 'package:world_time/core/constants/enums/preference_keys.dart';

class LocaleManager {
  static final LocaleManager _instance = LocaleManager._init();

  SharedPreferences? _preferences;
  static LocaleManager get instance => _instance;

  LocaleManager._init() {
    SharedPreferences.getInstance().then((value) {
      _preferences = value;
    });
  }

  static Future prefrencesInit() async {
    instance._preferences ??= await SharedPreferences.getInstance();
  }

  Future<void> clearAll() async {
    await _preferences!.clear();
  }



  Future<void> setBoolValue(PreferencesKeys key,bool value) async {
    _preferences!.setBool(key.toString(), value);
  }

  bool getBoolValue(PreferencesKeys key) =>
      _preferences!.getBool(key.toString()) ?? true;
}
