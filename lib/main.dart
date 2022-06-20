import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:world_time/core/init/theme/light_theme/light_theme.dart';
import 'package:world_time/view/home_page/view/home_page_view.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: LightTheme.instance!.lightTheme,
      home: const HomePageView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
