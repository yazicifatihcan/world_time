import 'package:flutter/material.dart';
import 'package:world_time/core/constants/navigation/navigation_constants.dart';
import 'package:world_time/core/extension/context_extension.dart';
import 'package:world_time/core/extension/string_extension.dart';

class CustomTileDesign extends StatelessWidget {
  const CustomTileDesign({super.key, required this.title, required this.index});
  final int index;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: context.paddingDynamicRight(15),
          child: _buildTile(context),
        ),
        Positioned(
          bottom: context.dynamicHeight(4),
          right: context.dynamicWidth(5),
          child: _circleButtonWithCenterArrow(context),
        )
      ],
    );
  }

  Container _buildTile(BuildContext context) {
    return Container(
          height: context.dynamicHeight(54),
          width: double.infinity,
          decoration: _boxDecoration(context),
          child: Padding(
            padding: context.onlyLeftPadding,
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  title.formatTimeZoneName(),
                  style: context.textTheme.headline2!
                      .copyWith(fontWeight: FontWeight.w400),
                )),
          ),
        );
  }

  BoxDecoration _boxDecoration(BuildContext context) {
    return BoxDecoration(
            color: context.theme.colorScheme.secondary,
            borderRadius: BorderRadius.all(context.listTileBorderRadius),
          );
  }

  Container _circleButtonWithCenterArrow(BuildContext context) {
    return Container(
            height: context.dynamicHeight(46),
            width: context.dynamicWidth(30),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: context.theme.colorScheme.surface,
                    width: context.dynamicWidth(3))),
            child: FloatingActionButton(
              heroTag: index,
              elevation: 0,
              onPressed: () {
                Navigator.pushNamed(context, NavigationConstants.detailsPage,arguments: title);
                //Instead of giving direct parameter to detailsPage we are sending the data that we want to send through args property 
              },
              child: Icon(Icons.chevron_right_outlined,
                  color: context.theme.colorScheme.primary),
            ));
  }
}
