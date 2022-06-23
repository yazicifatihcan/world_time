// ignore_for_file: constant_identifier_names

import 'package:lottie/lottie.dart';

enum LottieEnums {

  lottie_loading
}

extension ImagePathsExtension on LottieEnums {
  String path() {
    return 'assets/lottie/$name.json';
  }

  LottieBuilder toLottieAsset({double? height}) {
    return Lottie.asset(path(),height: height);
  }
}