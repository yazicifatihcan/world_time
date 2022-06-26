import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:world_time/core/constants/app_constants/app_constants.dart';
import 'package:world_time/core/constants/enums/preference_keys.dart';
import 'package:world_time/core/constants/navigation/navigation_constants.dart';
import 'package:world_time/core/init/cache/locale_manager.dart';
import 'package:world_time/core/init/general_init/general_init.dart';
import 'package:world_time/core/init/notifier/theme_notifier.dart';
import 'package:world_time/core/init/routes/routes.dart';


void main() async {
  final GeneralInit _generalInit = GeneralInit();
  await _generalInit.init();
  runApp(EasyLocalization(
    supportedLocales: _generalInit.languageInit.supportedLocales,
    path: _generalInit.languageInit.languagePath,
    fallbackLocale: _generalInit.languageInit.supportedLocales[0],

    child: ChangeNotifierProvider<ThemeNotifier>(
      create: (context) => ThemeNotifier(isLight:LocaleManager.instance.getBoolValue(PreferencesKeys.isThemeLight)),
      builder: (context, child) => const MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: ApplicationConstants.APP_NAME,
      theme: context.watch<ThemeNotifier>().currentTheme,
      initialRoute: NavigationConstants.homePage,
      routes: routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
