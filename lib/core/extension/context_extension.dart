import 'dart:math';

import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

extension MediaQueryExtension on BuildContext {
  double get height => mediaQuery.size.height;
  double get width => mediaQuery.size.width;

  // 812 is the height value that designer used
  double dynamicHeight(double value) => (value * height) / 812;
  // 375 is the width value that designer used
  double dynamicWidth(double value) => (value * width) / 375;
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorTheme => theme.colorScheme;
}

extension BorderRadiusExtension on BuildContext {
  Radius get appBarBottomRadius => Radius.circular(dynamicHeight(32));
  Radius get searchFieldBorderRadius => Radius.circular(dynamicHeight(99));
  Radius get listTileBorderRadius => Radius.circular(dynamicHeight(8));
}

extension EmptySizedBox on BuildContext {
  SizedBox emptyDynamicHeightSizedBox(double value) => SizedBox(
        height: dynamicHeight(value),
      );

    SizedBox emptyDynamicWidthSizedBox(double value) => SizedBox(
        width: dynamicWidth(value),
      );

}

extension PaddingExtensionAll on BuildContext {
  EdgeInsets paddingDynamicRight(double value) =>
      EdgeInsets.only(right: (dynamicWidth(20)));
  // EdgeInsets get paddingNormal => EdgeInsets.all(normalValue);
  // EdgeInsets get paddingMedium => EdgeInsets.all(mediumValue);
  // EdgeInsets get paddingHigh => EdgeInsets.all(highValue);
}

extension PaddingExtensionSymetric on BuildContext {
  // EdgeInsets get paddingLowVertical => EdgeInsets.symmetric(vertical: lowValue);
  // EdgeInsets get paddingNormalVertical =>
  //     EdgeInsets.symmetric(vertical: normalValue);
  // EdgeInsets get paddingMediumVertical =>
  //     EdgeInsets.symmetric(vertical: mediumValue);
  // EdgeInsets get paddingHighVertical =>
  //     EdgeInsets.symmetric(vertical: highValue);

  EdgeInsets get paddingGeneralHorizontal =>
      EdgeInsets.symmetric(horizontal: dynamicWidth(33));
  EdgeInsets get generalHomePageBodyPadding =>
      EdgeInsets.only(left: dynamicWidth(33), right: dynamicWidth(18));
  EdgeInsets get customTilePadding => EdgeInsets.only(bottom: dynamicWidth(10));
  EdgeInsets get onlyLeftPadding => EdgeInsets.only(left: dynamicWidth(20));
  EdgeInsets get customLowSizeAppBar => EdgeInsets.only(left: dynamicWidth(38),right:dynamicWidth(38) ,bottom:dynamicHeight(24) );

  // EdgeInsets get paddingNormalHorizontal =>
  //     EdgeInsets.symmetric(horizontal: normalValue);
  // EdgeInsets get paddingMediumHorizontal =>
  //     EdgeInsets.symmetric(horizontal: mediumValue);
  // EdgeInsets get paddingHighHorizontal =>
  //     EdgeInsets.symmetric(horizontal: highValue);
}
