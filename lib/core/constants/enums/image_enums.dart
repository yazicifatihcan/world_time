// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

enum ImageEnums { app_logo,app_logo_light }

extension ImagePathsExtension on ImageEnums {
  String path() {
    return 'assets/images/$name.png';
  }

  Image toAssetImage({Color? color}) {
    return Image(
      image: AssetImage(path()),
      fit: BoxFit.contain,
    );
  }
}
