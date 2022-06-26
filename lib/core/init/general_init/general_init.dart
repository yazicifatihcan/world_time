import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:world_time/core/init/cache/locale_manager.dart';
import 'package:world_time/core/init/language/language_init.dart';

class GeneralInit {
  final LanguageInit languageInit = LanguageInit();


  //Here we have everything that we initialize before app starts
  Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await LocaleManager.prefrencesInit();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }
}