import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:world_time/core/constants/enums/preference_keys.dart';
import 'package:world_time/core/constants/enums/svg_icon_enum.dart';
import 'package:world_time/core/extension/context_extension.dart';
import 'package:world_time/core/extension/date_time_format_extension.dart';
import 'package:world_time/core/init/cache/locale_manager.dart';
import 'package:world_time/core/init/notifier/theme_notifier.dart';

class HomePageCustomAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const HomePageCustomAppBar(
      {super.key,
      required this.height,
      required this.searchBar,
      required this.dateTime,required this.userName});
  final double height;
  final Widget searchBar;
  final DateTime dateTime;
  final String userName;
  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: preferredSize.height,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: context.dynamicHeight(199),
            decoration: _boxDecoration(context),
            child: Padding(
              padding: context.paddingGeneralHorizontal,
              child: _buildColumnBody(context),
            ),
          ),
          Positioned(
              bottom: context.dynamicHeight(0),
              left: context.dynamicWidth(33),
              child: searchBar),

          
        ],
      ),
    );
  }

  Column _buildColumnBody(BuildContext context) {
    return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                context.emptyDynamicHeightSizedBox(55),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _headline2Text(context,dateTime.basedOnTime(userName)),
                    _themeChangeIcon(context),
                  ],
                ),
                Text(
                  dateTime.hourMinuteFormatter(),
                  style: context.textTheme.headline1,
                ),
                context.emptyDynamicHeightSizedBox(5),
                _headline2Text(context,dateTime.dayMonthFullDayName(context)),
               
              ],
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

  Text _headline2Text(BuildContext context,String content) {
    return Text(
                  content,
                  style: context.textTheme.headline2,
                );
  }

  InkWell _themeChangeIcon(BuildContext context) {
    return InkWell(
                      onTap: () async {
                        Provider.of<ThemeNotifier>(context, listen: false)
                            .changeTheme();
                      },
                      child: Container(
                        height: context.dynamicHeight(40),
                        width: context.dynamicWidth(40),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: context.theme.colorScheme.outline,
                                width: 3),
                            shape: BoxShape.circle,
                            color: context.theme.colorScheme.primary),
                        child: Center(
                          child: LocaleManager.instance
                                  .getBoolValue(PreferencesKeys.isThemeLight)
                              ? SvgEnums.dark_mode_icon.svgIcon()
                              : SvgEnums.light_mode_icon.svgIcon(),
                        ),
                      ),
                    );
  }
}
