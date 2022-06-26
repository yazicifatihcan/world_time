// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:world_time/core/constants/app_constants/app_constants.dart';

enum ImageEnums { app_logo,app_logo_light }

extension ImagePathsExtension on ImageEnums {
  String path() {
    return '${ApplicationConstants.LANG_ASSET_IMAGES}$name.png';
  }

  Image toAssetImage({Color? color}) {
    return Image(
      image: AssetImage(path()),
      fit: BoxFit.contain,
    );
  }
}
