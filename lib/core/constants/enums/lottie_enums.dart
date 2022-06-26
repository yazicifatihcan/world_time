// ignore_for_file: constant_identifier_names

import 'package:lottie/lottie.dart';
import 'package:world_time/core/constants/app_constants/app_constants.dart';

enum LottieEnums {

  lottie_loading,dark_theme_loading_lottie,light_theme_loading_lottie,no_wifi
}

extension ImagePathsExtension on LottieEnums {
  String path() {
    return '${ApplicationConstants.LANG_ASSET_LOTTIE}$name.json';
  }

  LottieBuilder toLottieAsset({double? height}) {
    return Lottie.asset(path(),height: height);
  }
}