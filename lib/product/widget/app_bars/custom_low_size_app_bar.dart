import 'package:flutter/material.dart';
import 'package:world_time/core/constants/enums/image_enums.dart';
import 'package:world_time/core/constants/icon/icon_constants.dart';
import 'package:world_time/core/extension/context_extension.dart';
import 'package:world_time/core/init/cache/locale_manager.dart';

import '../../../core/constants/enums/preference_keys.dart';

class CustomLowSizeAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomLowSizeAppBar({super.key, required this.height});

  final double height;
  @override
  Size get preferredSize => Size.fromHeight(height);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        decoration: _boxDecoration(context),
        child: Padding(
          padding: context.customLowSizeAppBar,
          child: _buildBody(context),
        ));
  }

  Align _buildBody(BuildContext context) {
    return Align(
          alignment: Alignment.bottomLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _backArrow(context),
              const Spacer(),
              _appLogo(context),
              const Spacer(),
            ],
          ),
        );
  }

  BoxDecoration _boxDecoration(BuildContext context) {
    return BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: context.appBarBottomRadius,
            bottomRight: context.appBarBottomRadius),
        color: context.colorTheme.secondary,
      );
  }

  InkWell _backArrow(BuildContext context) {
    return InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child:  Icon(IconConstants.instance.arrowBack));
  }

  //app logo widget in app bar. Images changes bbased on theme.
  SizedBox _appLogo(BuildContext context) {
    return SizedBox(
                width: context.dynamicWidth(149),
                height: context.dynamicHeight(16),
                child: LocaleManager.instance.getBoolValue(PreferencesKeys.isThemeLight) ? ImageEnums.app_logo.toAssetImage():ImageEnums.app_logo_light.toAssetImage(),
              );
  }
}

