import 'package:flutter/material.dart';
import 'package:world_time/core/constants/enums/lottie_enums.dart';
import 'package:world_time/core/extension/context_extension.dart';
import 'package:world_time/core/init/cache/locale_manager.dart';

import '../../core/constants/enums/preference_keys.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  //this widget returns loading animation based on theme and loadState
  Widget build(BuildContext context) {
    return Center(
        child: LocaleManager.instance.getBoolValue(PreferencesKeys.isThemeLight)
            ? LottieEnums.light_theme_loading_lottie
                .toLottieAsset(height: context.dynamicHeight(70))
            : LottieEnums.dark_theme_loading_lottie
                .toLottieAsset(height: context.dynamicHeight(70)));
  }
}
