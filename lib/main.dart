import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:world_time/core/constants/enums/preference_keys.dart';
import 'package:world_time/core/init/cache/locale_manager.dart';
import 'package:world_time/core/init/notifier/theme_notifier.dart';
import 'package:world_time/view/home_page/view/home_page_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocaleManager.prefrencesInit();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(ChangeNotifierProvider<ThemeNotifier>(
    create: (context) => ThemeNotifier(isLight:LocaleManager.instance.getBoolValue(PreferencesKeys.isThemeLight)),
    builder: (context, child) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: context.watch<ThemeNotifier>().currentTheme,
      home: const HomePageView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
