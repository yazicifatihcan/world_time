import 'package:flutter/material.dart';
import 'package:world_time/core/extension/context_extension.dart';
import 'package:world_time/core/extension/string_extension.dart';
import 'package:world_time/view/detail_page/view/detail_page_view.dart';

class CustomTileDesign extends StatelessWidget {
  CustomTileDesign({super.key, required this.title,required this.index});
  int index;
  String title;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: context.paddingDynamicRight(15),
          child: Container(
            height: context.dynamicHeight(54),
            width: double.infinity,
            decoration: BoxDecoration(
              color: context.theme.colorScheme.secondary,
              borderRadius: BorderRadius.all(context.listTileBorderRadius),
            ),
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
          ),
        ),
        Positioned(
          bottom: context.dynamicHeight(4),
          right: context.dynamicWidth(5),
          child: Container(
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailPageView(path: title,)));
                },
                child: Icon(Icons.chevron_right_outlined,
                    color: context.theme.colorScheme.primary),
              )),
        )
      ],
    );
  }
}
