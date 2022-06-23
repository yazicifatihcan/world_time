import 'package:flutter/material.dart';
import 'package:world_time/core/constants/enums/svg_icon_enum.dart';
import 'package:world_time/core/extension/context_extension.dart';

class HomePageCustomAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  HomePageCustomAppBar(
      {super.key, required this.height, required this.searchBar});
  double height;
  Widget searchBar;
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
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: context.appBarBottomRadius,
                  bottomRight: context.appBarBottomRadius),
              color: context.colorTheme.secondary,
            ),
            child: Padding(
              padding: context.paddingGeneralHorizontal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  context.emptyDynamicHeightSizedBox(55),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Günaydın, Özgür!",
                        style: context.textTheme.headline2,
                      ),
                      Container(
                        height: context.dynamicHeight(40),
                        width: context.dynamicWidth(40),
                        decoration: BoxDecoration(border: Border.all(color: context.theme.colorScheme.outline,width: 3),shape: BoxShape.circle,color:context.theme.colorScheme.primary ),
                        child: Center(
                          child: SvgEnums.light_mode_icon.svgIcon(),
                        ),
                      ),
                      
                    ],
                  ),
                  Text(
                    "09 : 54",
                    style: context.textTheme.headline1,
                  ),
                  context.emptyDynamicHeightSizedBox(5),
                  Text(
                    "8 Haziran, Çarşamba",
                    style: context.textTheme.headline2,
                  ),
                ],
              ),
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
}
