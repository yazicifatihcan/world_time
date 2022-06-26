// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:world_time/core/constants/app_constants/app_constants.dart';

enum SvgEnums {
  search_icon,
  light_mode_icon,
  dark_mode_icon,
  
}

extension ImagePathsExtension on SvgEnums {
  String path() {
    return '${ApplicationConstants.LANG_ASSET_ICON}$name.svg';
  }

  SvgPicture svgIcon({Color? color}) {
    return SvgPicture.asset(path(),color: color,fit: BoxFit.scaleDown,);
  }
  
}