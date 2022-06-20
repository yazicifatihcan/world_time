import 'package:flutter/material.dart';
import 'package:world_time/core/extension/context_extension.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({super.key, required this.height,required this.searchBar});
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
                  context.emptyHighSizedBoxHeight,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Günaydın, Özgür!",
                        style: context.textTheme.headline2,
                      ),
                      Icon(Icons.night_shelter),
                    ],
                  ),
                  context.emptyLowSizedBoxHeight,
                  Text(
                    "09 : 54",
                    style: context.textTheme.headline1,
                  ),
                  context.emptyLowSizedBoxHeight,
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
