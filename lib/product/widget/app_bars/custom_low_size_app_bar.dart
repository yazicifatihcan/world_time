import 'package:flutter/material.dart';
import 'package:world_time/core/constants/enums/image_enums.dart';
import 'package:world_time/core/extension/context_extension.dart';

class CustomLowSizeAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  CustomLowSizeAppBar({super.key, required this.height});

  double height;
  @override
  Size get preferredSize => Size.fromHeight(height);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: context.appBarBottomRadius,
              bottomRight: context.appBarBottomRadius),
          color: context.colorTheme.secondary,
        ),
        child: Padding(
          padding: context.customLowSizeAppBar,
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back)),
                const Spacer(),
                SizedBox(
                  width: context.dynamicWidth(149),
                  height: context.dynamicHeight(16),
                  child: ImageEnums.app_logo_light.toAssetImage(),
                ),
                const Spacer(),
              ],
            ),
          ),
        ));
  }
}


// AppBar(
//         centerTitle: true,
//         title: SizedBox(

//           width: context.dynamicWidth(149),
//           height: context.dynamicHeight(16),
//           child: ImageEnums.app_logo.toAssetImage(),
//         ),
//         shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.only(
//                 bottomLeft: context.appBarBottomRadius,
//                 bottomRight: context.appBarBottomRadius)));
